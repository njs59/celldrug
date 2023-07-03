function [param_out] = init_params(drug_present, drug_eqn)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
no_params = 7;
if drug_eqn == 1
    no_params = no_params + 2;
end
param_out = zeros(no_params,1); 

grid_size = 10;
l = grid_size;

r1 = 0.027;
param_out(1) = r1;

K1 = l^2;
param_out(2) = K1;
K2 = l^2;
param_out(3) = K2;

if drug_present == 1
    d_drug = 0.005;
    d = d_drug;
elseif drug_present == 0
    d = 0;
end
param_out(4) = d;


resistance_cost = 0.5;
r2 = r1*(1-resistance_cost);
param_out(5) = r2;

K3 = l^2;
param_out(6) = K3;
K4 = l^2;
param_out(7) = K4;

if drug_eqn == 1
    p = 0.02;
    param_out(8) = p;
    q = 0.01;
    param_out(9) = q;
end

end