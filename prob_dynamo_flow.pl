% --------------------------
% Probabilidades marginais
% --------------------------

0.05::flw_true.                % 5% chance de volante estar desgastado
flw_false :- \+flw_true.       % 95% implícito

% Fixamos a condição da rua como "neve"
str_snow.                      % Fato lógico (não probabilístico)
evidence(str_snow, true).      % Evidência que str = snow_covered

% --------------------------
% Probabilidades condicionais (auxiliares)
% --------------------------

% Probabilidade de R = true em diferentes cenários
0.8::p_r1.   % str = snow, flw = true
0.5::p_r2.   % str = snow, flw = false

% Probabilidade de V = true em diferentes estados de R
0.9::p_v_if_r.
0.1::p_v_if_not_r.

% --------------------------
% Regras causais
% --------------------------

% Definindo quando R é ativado
r :- str_snow, flw_true, p_r1.
r :- str_snow, flw_false, p_r2.

% Definindo quando V é ativado
v :- r, p_v_if_r.
v :- \+r, p_v_if_not_r.

% --------------------------
% Consulta ao modelo
% --------------------------

query(v).
