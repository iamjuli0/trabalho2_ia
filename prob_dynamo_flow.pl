% --------------------------
% Probabilidades iniciais
% --------------------------

% Chances do volante deslizante
0.05::flw_true.             % 5% de chance
flw_false :- \+flw_true.    % O complemento lógico, ou seja, 95% de chance

% A condição da rua é "neve" (Str = snow_covered) - Deixaremos em evidência!
str(snow_covered).

% --------------------------
% Probabilidade condicional de R
% --------------------------

% Se a rua está coberta de neve E o volante está desgastado,
% então o dínamo desliza com 70% de chance
0.8::r :- str(snow_covered), flw_true.  % Caso r = true
                                        % Caso r = false, já seria 20% implicitamente

% Se a rua está coberta de neve E o volante NÃO está desgastado,
% então o dínamo desliza com 40% de chance
0.5::r :- str(snow_covered), flw_false. % Caso r = true
                                        % Caso r = false, já seria 50% implicitamente

% --------------------------
% Probabilidade condicional de V
% --------------------------

% Se o dínamo está deslizando, tensão é gerada com 90% de chance
0.9::v :- r.

% Se o dínamo NÃO está deslizando, tensão só aparece com 10% de chance
0.1::v :- \+r.

% --------------------------
% Evidência fixa no modelo
% --------------------------

% Estamos fixando a condição da rua como "neve"
evidence(str(snow_covered), true).

% --------------------------
% Consulta ao modelo
% --------------------------

% Qual a probabilidade da tensão estar presente (V = true)?
query(v).
