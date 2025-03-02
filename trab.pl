/*
    Da pra mudar esse nome com certeza (resultado), coisa feia do k7
*/

diagnostico_consumo("É possível que haja um problema como: quedas de tensão em longas distâncias, transformadores ineficientes ou Efeito Joule (perda por aquecimento)") :-
    avaliacao(tecnico).

diagnostico_consumo("É possível que haja problemas como: ligação clandestina, manipulação de medidores, desvio de energia ou houve um erro na leitura do consumo") :-
    avaliacao(nao_tecnico).

diagnostico_consumo("Está tudo certo com o seu consumo de energia!") :-
    avaliacao(regular).

/*
    Não sei mexer com Prolog, mas acho que ta certo
*/
avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    comsumo_estimado(baixo).

avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    comsumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    comsumo_estimado(alto).

avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(medio),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(medio),
    comsumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(medio),
    comsumo_estimado(alto).

avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(alto),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(alto),
    comsumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(alto),
    comsumo_estimado(alto).

---

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    comsumo_estimado(medio).

avaliacao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    comsumo_estimado(alto).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(nao).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(medio).

avaliacao(tecnico) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(alto),
    historico(nao).

---

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    comsumo_estimado(medio).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    comsumo_estimado(alto).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(medio),
    historico(nao).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(nao).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(baixo),
    historico(nao).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(medio),
    historico(nao).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(alto).

---

avaliacao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(alto),
    historico(sim).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(medio),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(baixo),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(medio),
    historico(sim).

/*
    Regras de interação com o usuário
*/

consumo_atual(CA) :-
    repeat,
    write('Qual o seu consumo atual? (baixo, medio, alto): '),
    read(CA),
    member(CA, [baixo, medio, alto]), !.

consumo_medio(CM) :-
    repeat,
    write('Qual o seu consumo médio? (baixo, medio, alto): '),
    read(CM),
    member(CM, [baixo, medio, alto]), !.

consumo_estimado(CE) :-
    repeat,
    write('Qual o seu consumo estimado? (baixo, medio, alto): '),
    read(CE),
    member(CE, [baixo, medio, alto]), !.

historico(H) :-
    repeat,
    write('Houve algum problema com o seu consumo de energia? (sim, nao): '),
    read(H),
    member(H, [sim, nao]), !.

% Execução principal
main :-
    retractall(fato(_, _)),
    consumo_atual(CA),
    consumo_medio(CM),
    consumo_estimado(CE),
    historico(H),
    diagnostico_consumo(Resultado),
    write('Resposta: '), write(Resultado), nl.