function [dA_dt] = rhs_A(drug_present, res_drug_death, drug_eqn, x, t)
    params = init_params(drug_present, res_drug_death, drug_eqn);
    a = params(7);
    b = params(8);
    
    %S = x(1), R = x(2), A = x(3), D = x(4)
    dA_dt = a*x(2) - b*x(3);
end