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
    
    


    


