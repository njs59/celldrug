function [dD_dt] = rhs_D(drug_present, drug_eqn, x, t)
    params = init_params(drug_present, drug_eqn);
    p = params(7);
    q = params(8);
    
    
    %S = x(1), R = x(2), D = x(3)
    dD_dt = -p*x(1)*x(3) -q*x(3);
end