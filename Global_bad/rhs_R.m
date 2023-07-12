function [dR_dt] = rhs_R(drug_present, res_drug_death, drug_eqn, x, t)
    params = init_params(drug_present, res_drug_death, drug_eqn);
    r2 = params(4);
    d3 = params(5);
    d4 = params(6);
    
    %S = x(1), R = x(2), A = x(3), D = x(4)
    dR_dt = r2*x(2) - d3*x(2) - d4*x(2)*x(3);
end