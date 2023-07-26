function [dS_dt] = rhs_S(drug_present, res_drug_death, drug_eqn, x, t)
    params = init_params(drug_present, res_drug_death, drug_eqn);
    r1 = params(1);
    d1 = params(2);
    d2 = params(3);
    
    %S = x(1), R = x(2), A = x(3), D = x(4)
    %dS_dt = r1*x(1)*((100-x(1))/100) - d1*x(1) - d2*x(1)*x(3);
    dS_dt = r1*x(1) - d1*x(1)^(2) - d2*x(1)*x(3);
end