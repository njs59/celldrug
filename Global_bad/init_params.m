function [param_out] = init_params(drug_present, res_drug_death, drug_eqn)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
no_params = 8;

param_out = zeros(no_params,1); 

r1 = 0.027;
param_out(1) = r1;

d1 = 0.001;
drug_effect = 0.002;

if drug_present == 1
    d1 = d1 + drug_effect;
end
param_out(2) = d1;

d2 = 0.001;
param_out(3) = d2;

resistance_cost = 0;
r2 = r1*(1-resistance_cost);
param_out(4) = r2;


d3 = 0.001;
drug_effect_R = 0;

if drug_present == 1 && res_drug_death == 1
    d3 = d3 + drug_effect_R;
end
param_out(5) = d3;

d4 = 0.001;
param_out(6) = d4;

a = 0.02;
param_out(7) = a;
b = 0.02;
param_out(8) = b;





if drug_eqn == 1
    p = 0.02;
    param_out(9) = p;
    q = 0.01;
    param_out(10) = q;
end


end