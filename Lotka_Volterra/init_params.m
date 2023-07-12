function [param_out] = init_params(drug_present, res_drug_death, drug_eqn)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
no_params = 8;
if drug_eqn == 1
    no_params = no_params + 2;
end
param_out = zeros(no_params,1); 

grid_size = 10;
l = grid_size;

K = l^2;
K1 = K;
K2 = K;
K3 = K;
K4 = K;

r1 = 0.027;
param_out(1) = r1;

alpha12 = 2;
param_out(2) = alpha12;

%K1 = l^2;
param_out(3) = K1;
%K2 = l^2;
param_out(4) = K2;

if drug_present == 1
    d_drug = 0.024;
    d1 = d_drug;
elseif drug_present == 0
    d1 = 0;
end
param_out(5) = d1;


resistance_cost = 0.5;
r2 = r1*(1-resistance_cost);
param_out(6) = r2;

alpha21 = 0.1;
param_out(7) = alpha21;

%K3 = l^2;
param_out(8) = K3;
%K4 = l^2;
param_out(9) = K4;

if drug_present == 1 && res_drug_death == 1
    % d_drug = 0.022;
    res_power = 0.5;
    d2 = res_power * d_drug;
else 
    d2 = 0;
end
param_out(10) = d2;

if drug_eqn == 1
    p = 0.02;
    param_out(11) = p;
    q = 0.01;
    param_out(12) = q;
end

delta1 = 1 - d1/r1;
delta2 = 1 - d2/r2;

c1_hat = delta1 - delta2*(1/alpha21);
c2_hat = delta1*(1/alpha12) - delta2;

disp('c hat values')
disp(c1_hat)
disp(c2_hat)

end