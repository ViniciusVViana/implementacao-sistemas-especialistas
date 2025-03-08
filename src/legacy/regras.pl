/*
    Regras de classificação diretamente baseadas na tabela fornecida
*/ 
avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    consumo_estimado(baixo).

avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    consumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(baixo),
    consumo_estimado(alto).

avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(medio),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(medio),
    consumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(medio),
    consumo_estimado(alto).

avaliacao(tecnico) :-
    consumo_atual(alto),
    consumo_medio(alto),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(alto),
    consumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(alto),
    consumo_medio(alto),
    consumo_estimado(alto).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    consumo_estimado(medio).

avaliacao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(baixo),
    consumo_estimado(alto).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    consumo_estimado(medio).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(medio),
    consumo_estimado(alto),
    historico(nao).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(alto),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(medio),
    consumo_medio(alto),
    consumo_estimado(medio).

avaliacao(tecnico) :-
    consumo_atual(medio),
    consumo_medio(alto),
    consumo_estimado(alto),
    historico(nao).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    consumo_estimado(medio).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(baixo),
    consumo_estimado(alto).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    consumo_estimado(baixo).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    consumo_estimado(medio),
    historico(nao).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    consumo_estimado(alto),
    historico(nao).

avaliacao(regular) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    consumo_estimado(baixo),
    historico(nao).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    consumo_estimado(medio),
    historico(nao).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    consumo_estimado(alto).

avaliacao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(medio),
    consumo_estimado(alto),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(medio),
    consumo_medio(alto),
    consumo_estimado(alto),
    historico(sim).

avaliacao(tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    consumo_estimado(medio),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(medio),
    consumo_estimado(alto),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    consumo_estimado(baixo),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    consumo_estimado(medio),
    historico(sim).

avaliacao(nao_tecnico) :-
    consumo_atual(baixo),
    consumo_medio(alto),
    consumo_estimado(medio),
    historico(sim).