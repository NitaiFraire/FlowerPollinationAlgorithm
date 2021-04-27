min_values([-5.0,-5.0]).
max_values([5.0,5.0]).

gen([a,t,g,g]).


%------------------- Utilidades -------------------%

% Generar matriz de zeros
zero_matrix(0, _, []) :- !.
zero_matrix(N, M, [K|Ks]) :-
    N1 is N - 1,
    zero_vector(M, K),
    zero_matrix(N1, M, Ks).


% Generar vector de zeros
zero_vector(0, []) :- !.
zero_vector(M, [0|Ks]) :-
    M1 is M - 1,
    zero_vector(M1, Ks).

% Tamaño de listas
list_length([],0).
list_length([_|R],N) :-
     list_length(R,N1), N is N1 + 1.

% eliminar de listas
% elemento a eliminar, lista, nueva lista
list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

% For
for([], GEN_LENGTH, I).
for([P|R], GEN_LENGTH, I) :-
    % preparacion de datos
    I =< GEN_LENGTH,

    min_values([MIN_P|MIN_R]),
    max_values([MAX_P|MAX_R]),
    random(MIN_P,MAX_P, X),
    random(MIN_P,MAX_P, Y),
    gen(GENES),
    nth1(I, GENES, GEN_ACTUAL),

    %operaciones par rellenar la matrzi
    nth1(1, LISTA1, X, P),
    nth1(2, LISTA2, Y, LISTA1),
    nth1(3, LISTA3, GEN_ACTUAL, LISTA2),
    
    % eliminar los ceros
    list_delete(0, LISTA3, NEW_LIST),
    list_delete(0, NEW_LIST, NEW_LIST2),
    list_delete(0, NEW_LIST2, MATRIX),
    writeln(MATRIX),
    
    A is I + 1,
	for(R, GEN_LENGTH, A).

fill_initial_matrix(MATRIX) :-
    gen(X),
    list_length(X, GEN_LENGTH),
    for(MATRIX, GEN_LENGTH, 1).

% col(N, Matrix, COLUMN) :-
%     maplist(nth1(N), Matrix, COLUMN),
%     write(COLUMN).
    % editar cada indice de las primeras dos columnas con numeros aleatorios con un ciclo for

% for([]).
% for([P|R], N) :-
%     N > 0,
%         for([P] ),
%     S is N-1,
%     for([R],S).

%------------------- Utilidades -------------------%


% calcular levy flight
levy_flight(L) :-
    random(R1),
    random(R2),

    % calcular SIGMA_NUMERADOR
    X is lgamma(1+1.5),
    Y is pi()*(1.5/2.0),
    Z is sin(Y),
    SIGMA_NUM is X*Z,
    
    % calcular SIGMA_DENOMINADOR
    A is abs(lgamma(1+(1.5/2))*1.5),
    B is 2**(0.5/2),
    SIGMAN_DEN is A*B,

    % calcular SIGMA
    C is abs(SIGMA_NUM/SIGMAN_DEN),
    SIGMA is C**1/1.5,

    % calcular Levi
    L is 0.01*R1*SIGMA/abs(R2)**0.25.
    

initial_position(MATRIX) :-
    min_values(X),
    list_length(X,Y),
    Z is Y+1,
    gen(N_FLORES),
    list_length(N_FLORES, LENGHT),
    zero_matrix(LENGHT,Z,MATRIX), % generar matriz inicial 

    % random(-5.0, 5.0, R1),
    fill_initial_matrix(MATRIX).
    % writeln(MATRIX),
    % for(MATRIX).
    % col(N, MATRIX, COLUMN).
    % col(N, MATRIX, COLUMN).
    % write(MATRIX).
    % writeln(MATRIX).

    % nth1(1, [lista], 20, X).
    
    
    % list_length(min_values(Y),X).

    % L is length(MIN_VALUES, Int).
    
    % POSITION is zero_matrix(FLORES, length(MIN_VALUES+1, Int)),
    % write(POSITION).
    

