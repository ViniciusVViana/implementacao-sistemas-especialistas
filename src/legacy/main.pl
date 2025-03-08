:- consult('regras.pl').

/*
    Predicados dinâmicos para armazenar dados temporários
*/
dynamic consumo_atual/1.
dynamic consumo_medio/1.
dynamic consumo_estimado/1.
dynamic historico/1.

/*
    Menu interativo para realizar avaliações
*/
menu :-
    write('--- MENU DO SISTEMA ESPECIALISTA ---'), nl,
    write('1 - Avaliar cliente.'), nl,
    write('2 - Sair do sistema...'), nl,
    write('Escolha uma opcao: '),
    read(Opcao), nl,
    executar_opcao(Opcao), 
    nl.

/*
    Permitir entrada dinâmica de dados
*/
set_dados(Atual, Medio, Estimado, Historico) :-
    retractall(consumo_atual(_)),
    retractall(consumo_medio(_)),
    retractall(consumo_estimado(_)),
    retractall(historico(_)),
    assertz(consumo_atual(Atual)),
    assertz(consumo_medio(Medio)),
    assertz(consumo_estimado(Estimado)),
    assertz(historico(Historico)).

/*
    Pergunta um valor por vez ao usuário
*/
perguntar_dado(Pergunta, Valor) :-
    write(Pergunta), read(Valor).

/*
    Executa a opção escolhida
*/
executar_opcao(1) :-
    perguntar_dado('Digite o nome do cliente: ', Cliente),
    perguntar_dado('Digite o consumo atual do cliente (baixo/medio/alto): ', Atual),
    perguntar_dado('Digite o consumo medio do cliente (baixo/medio/alto): ', Medio),
    perguntar_dado('Digite o consumo estimado do cliente (baixo/medio/alto): ', Estimado),
    perguntar_dado('O cliente possui historico de infracao? (sim/nao): ', Historico), nl,
    
    /*
        Inserir os dados no sistema
    */
    set_dados(Atual, Medio, Estimado, Historico),
    
    /*
        Avaliação com base nas regras definidas
    */
    verificar_problema(Cliente, X),
    menu.

executar_opcao(2) :-
    write('Saindo do sistema...'), nl.

executar_opcao(_) :-
    write('Opção inválida! Tente novamente.'), nl,
    menu.

/*
    Consulta para verificar a avaliação
*/
verificar_problema(Cliente, X) :-
    avaliacao(X),
    write('O problema do cliente '), write(Cliente), write('é: '), write(X), nl, nl,
    /*
        Se avaliação for técnica, chamar função para avaliar técnicas
    */
    ( X == 'tecnico' ->
        avaliar_tecnicas;
        true),
    fail.

/*
    Inicia o sistema
*/
start :- menu.

avaliar_tecnicas :-
    write('--- AVALIACAO DE PROBLEMAS TECNICOS ---'), nl,
    perguntar_dado('Digite a tensao inicial: ', TensaoInicial),
    perguntar_dado('Digite a tensao final: ', TensaoFinal),
    perguntar_dado('Digite a resistencia: ', Resistencia),
    perguntar_dado('Digite a corrente de entrada: ', CorrenteEntrada),
    perguntar_dado('Digite a corrente de saida: ', CorrenteSaida), nl,
    
    calcular_efeito_joule(CorrenteEntrada, Resistencia, ValorJoule),
    calcular_queda_tensao(TensaoInicial, TensaoFinal, ValorQueda),
    verificar_transformador(CorrenteEntrada, CorrenteSaida, ResultadoTransformador),
    
    nl,
    write('Resultados da avaliacao tecnica:'), nl,nl,
    write('Efeito Joule (Corrente^2 * Resistencia): '), write(ValorJoule), nl,
    ( ValorJoule > 5 ->
         write('-> Efeito Joule: Provavel Problema Tecnico ')
    ;    write('-> Efeito Joule: Dentro do esperado')
    ), nl,nl,
    write('Queda de Tensao (Tensao Inicial - Tensao Final): '), write(ValorQueda), nl,
    ( ValorQueda > 10 ->
         write('-> Queda de Tensao: Provavel Problema Tecnico ')
    ;    write('-> Queda de Tensao: Dentro do esperado')
    ), nl,nl,
    write('Transformador: '), nl,
    ( ResultadoTransformador = 'Nao Tecnica' ->
         write('-> Transformador Ineficiente: Provavel problema Tecnico ')
    ;    write('-> Transformador: Dentro do esperado')
    ), nl,nl,
    fail.

/*
    Calcula o efeito Joule: Corrente^2 * Resistência
*/
calcular_efeito_joule(Corrente, Resistencia, Valor) :-
    Valor is Corrente * Corrente * Resistencia.

/*
    Calcula a queda de tensao: Tensão_inicial - Tensão_final
*/
calcular_queda_tensao(TensaoInicial, TensaoFinal, Valor) :-
    Valor is TensaoInicial - TensaoFinal.

/*
    Verifica a condição do transformador:
    Se CorrenteEntrada > CorrenteSaida * 1.2, então o resultado é 'Nao Tecnica',
    caso contrário, 'Tecnica'.
*/
verificar_transformador(CorrenteEntrada, CorrenteSaida, Resultado) :-
    ( CorrenteEntrada > CorrenteSaida * 1.2 ->
         Resultado = 'Nao Tecnica'
    ;    Resultado = 'Tecnica'
    ).