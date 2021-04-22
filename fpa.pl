flowers(3).
min_values([-5,-5]).
max_values([5,5]).


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

% For
% for([]).
% for([P|R]) :-
% 	writeln(P),
% 	for(R).

for([]).
for([P|R], N) :-
    N > 0,
        for([P] ),
    S is N-1,
    for([R],S).

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
    

initial_position(N_FLORES) :-
    min_values(X),
    list_length(X,Y),
    Z is Y+1,
    zero_matrix(N_FLORES,Z,MATRIX), % generar matriz inicial
    for(MATRIX).
    % write(MATRIX).
    % writeln(MATRIX).
    
    
    % list_length(min_values(Y),X).

    % L is length(MIN_VALUES, Int).
    
    % POSITION is zero_matrix(FLORES, length(MIN_VALUES+1, Int)),
    % write(POSITION).
    

