% Declaração de predicados dinâmicos para armazenar os dados de entrada
:- dynamic(consumo_atual/1).
:- dynamic(tensao_medida/1).
:- dynamic(corrente_medida/1).
:- dynamic(consumo_hist/2).

% Dados internos fixos (fatos do sistema)
crescimento_vegetativo(1.035).    % 3,5% ao ano
tensao_atendimento(127).         % Tensão nominal de atendimento (V) para baixa tensão
fator_potencia(0.92).            % Fator de potência normatizado

% Classificação da tensão medida (para 127V)
% Faixas:
%   Adequada: 117 ≤ V ≤ 133
%   Precária: 110 ≤ V < 117 (inferior) ou 133 < V ≤ 135 (superior)
%   Crítica: V < 110 (inferior) ou V > 135 (superior)

tensao_status(V, adequada) :- V >= 117, V =< 133.
tensao_status(V, precaria_inferior) :- V >= 110, V < 117.
tensao_status(V, precaria_superior) :- V > 133, V =< 135.
tensao_status(V, critica_inferior) :- V < 110.
tensao_status(V, critica_superior) :- V > 135.


%% Cálculos Processados

% Consumo_medio: média dos dois consumos históricos (ano2 + ano1) / 2
compute_consumo_medio(Medio) :-
    consumo_hist(ConsumoAno2, ConsumoAno1),
    Medio is (ConsumoAno2 + ConsumoAno1) / 2.

% Consumo_estimado: usando regressão linear simples (reta definida por dois pontos)
% Para dois pontos, a inclinação é (ConsumoAno1 - ConsumoAno2) e a estimativa para o mês atual:
% Estimado = ConsumoAno1 + (ConsumoAno1 - ConsumoAno2)

compute_consumo_estimado(Estimado) :-
    consumo_hist(ConsumoAno2, ConsumoAno1),
    Estimado is 2 * ConsumoAno1 - ConsumoAno2.

% Corrente_media_atual:
% Fórmula: ((Consumo_atual * 1000 / 30 dias) / 24 horas) / (Tensão_atendimento * Fator_Potencia)

compute_corrente_media_atual(CorrenteMedia) :-
    consumo_atual(Consumo),
    tensao_atendimento(TA),
    fator_potencia(FP),
    CorrenteMedia is ((Consumo * 1000 / 30) / 24) / (TA * FP).


%% REGRAS DE CLASSIFICAÇÃO

% 1) Situação normal: Consumo_atual está dentro de ±10% do Consumo_medio

consumo_normal :-
    consumo_atual(Consumo),
    compute_consumo_medio(Medio),
    Lower is Medio * 0.9,
    Upper is Medio * 1.1,
    (Consumo >= Lower , Consumo =< Upper).

% Situação anormal: Quando o consumo está fora desse intervalo.

consumo_anormal :-
    consumo_atual(Consumo),
    compute_consumo_medio(Medio),
    Lower is Medio * 0.9,
    Upper is Medio * 1.1,
    (Consumo < Lower ; Consumo > Upper).

% 2) Possível perda técnica: se (Consumo_atual / Consumo_estimado) > 1.035
possivel_perda_tecnica :-
    consumo_atual(Consumo),
    compute_consumo_estimado(Estimado),
    crescimento_vegetativo(Crescimento),
    Ratio is Consumo / Estimado,
    Ratio > Crescimento.

% Sub-regras para perda técnica:

% a) Perda técnica por subtensão: se a tensão for precária ou crítica (inferior)
%    e a corrente medida > 1.2 * Corrente_media_atual

perda_tecnica_subtensao :-
    possivel_perda_tecnica,
    tensao_medida(V),
    ( tensao_status(V, precaria_inferior) ; tensao_status(V, critica_inferior) ),
    corrente_medida(CM),
    compute_corrente_media_atual(CM_media),
    (CM > 1.2 * CM_media).

% b) Perda técnica por sobretensão: se a tensão for precária ou crítica (superior)
%    e a corrente medida < 0.8 * Corrente_media_atual

perda_tecnica_sobretensao :-
    possivel_perda_tecnica,
    tensao_medida(V),
    ( tensao_status(V, precaria_superior) ; tensao_status(V, critica_superior) ),
    corrente_medida(CM),
    compute_corrente_media_atual(CM_media),
    (CM < 0.8 * CM_media).

% c) Perda técnica por efeito Joule: se a tensão for adequada e a corrente medida > 1.2 * Corrente_media_atual

perda_tecnica_joule :-
    possivel_perda_tecnica,
    tensao_medida(V),
    tensao_status(V, adequada),
    corrente_medida(CM),
    compute_corrente_media_atual(CM_media),
    (CM > 1.5 * CM_media). %%% (1.2 - 1.5)

% 3) Possível perda não-técnica: se o consumo estiver fora de ±10% do consumo_medio

possivel_perda_nao_tecnica :-
    consumo_anormal.

% Sub-regras para perda não-técnica:

% a) Possível perda não técnica por erro de medição de corrente: se a corrente medida desviar ±20% da corrente média

erro_medicao_corrente :- 
    possivel_perda_nao_tecnica,
    corrente_medida(CM),
    compute_corrente_media_atual(CM_media),
    Lower is CM_media * 0.8,
    Upper is CM_media * 1.2,
    (CM < Lower ; CM > Upper). %%% (adicionado parenteses)

% b) Possível perda não técnica por erro de medição de tensão: se a tensão medida for classificada como crítica

erro_medicao_tensao :-
    possivel_perda_nao_tecnica,
    tensao_medida(V),
    (tensao_status(V, critica_inferior) ; tensao_status(V, critica_superior)).

% c) Possível perda não técnica por desvio de energia: se Consumo_atual for inferior a 20% do Consumo_medio
possivel_desvio_energia :-
    possivel_perda_nao_tecnica,
    consumo_atual(Consumo),
    compute_consumo_medio(Medio),
    (Consumo < 0.2 * Medio). %%% (sinal invertido)

% d) Possível perda não técnica por fraude na medição: se a tensão estiver adequada e a corrente dentro de ±20%
%    mas o consumo for inferior a 20% do consumo_medio

possivel_fraude_medicao :-
    possivel_perda_nao_tecnica,
    tensao_medida(V),
    tensao_status(V, adequada),
    corrente_medida(CM),
    compute_corrente_media_atual(CM_media),
    Lower is CM_media * 0.8,
    Upper is CM_media * 1.2,
    (CM >= Lower, CM =< Upper),
    consumo_atual(Consumo),
    compute_consumo_medio(Medio),
    Consumo < 0.2 * Medio.