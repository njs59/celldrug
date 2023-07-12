function [dD_dt] = rhs_D(x, t)
    params = init_params(drug_present, res_drug_death, drug_eqn);
    p = params(9);
    q = params(10);
    
    
    %S = x(1), R = x(2), A = x(3), D = x(4)
    dD_dt = -p*x(1)*x(4) -q*x(4);
end