/*
    Da pra mudar esse nome com certeza (resultado), coisa feia do k7
*/

resultado("É possível que haja um problema como: quedas de tensão em logas distâncias, transformadores ineficientes ou Efeito Joule (perde por aquecimento)") :-
    avaliacao(tecnico).

resultado("É possível que haja problemas como: ligação clandestina, manipulação de medidores, desvio de energia ou houve um erro na leitura do consumo") :-
    avaliacao(nao_tecnico).

resultado("Esta tudo certo com o seu consumo de energia!") :-
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