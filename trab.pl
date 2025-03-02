
/*
    Não sei mexer com Prolog
*/
avalicao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    comsumo_estimado(baixo).

avalicao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    comsumo_estimado(medio).

avalicao(regular) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    comsumo_estimado(alto).

avalicao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(medio),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(alto),
    consumo_medio(medio),
    comsumo_estimado(medio).

avalicao(regular) :-
    consumo_atual(alto),
    consumo_medio(medio),
    comsumo_estimado(alto).

avalicao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(alto),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(alto),
    consumo_medio(alto),
    comsumo_estimado(medio).

avalicao(regular) :-
    consumo_atual(alto),
    consumo_medio(alto),
    comsumo_estimado(alto).

---

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    comsumo_estimado(medio).

avalicao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    comsumo_estimado(alto).

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(medio).

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(nao).

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(medio).

avalicao(tecnico) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(alto),
    historico(nao).

---

avalicao(regular) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    comsumo_estimado(medio).

avalicao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    comsumo_estimado(alto).

avalicao(regular) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(baixo).

avalicao(regular) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(medio),
    historico(nao).

avalicao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(nao).

avalicao(regular) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(baixo),
    historico(nao).

avalicao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(medio),
    historico(nao).

avalicao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(alto).

---

avalicao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(sim).

avalicao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(alto),
    comsumo_estimado(alto),
    historico(sim).

avalicao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(medio),
    historico(sim).

avalicao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    comsumo_estimado(alto),
    historico(sim).

avalicao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(baixo),
    historico(sim).

avalicao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    comsumo_estimado(medio),
    historico(sim).