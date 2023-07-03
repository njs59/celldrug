function [dR_dt] = rhs_R(drug_present, drug_eqn, x, t)
    params = init_params(drug_present, drug_eqn);
    r2 = params(5);
    K3 = params(6);
    K4 = params(7);
    
    
    %S = x(1), R = x(2), D = x(3)
    dR_dt = r2*x(2)*(1-(x(2)/K3)-(x(1)/K4));
end