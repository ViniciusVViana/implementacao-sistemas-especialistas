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
    write('1 - Avaliar Cliente'), nl,
    write('2 - Sair'), nl,
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
    write('O problema do cliente '), write(Cliente), write('é: '), write(X), nl, nl.
    fail.

/*
    Inicia o sistema
*/
start :- menu.