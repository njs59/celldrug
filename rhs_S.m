function [dS_dt] = rhs_S(drug_present, drug_eqn, x, t)
    params = init_params(drug_present, drug_eqn);
    r1 = params(1);
    K1 = params(2);
    K2 = params(3);
    d = params(4);
    
    %S = x(1), R = x(2), D = x(3)
    if drug_eqn == 0
        dS_dt = r1*x(1)*(1-(x(1)/K1)-(x(2)/K2)) - d*x(1);
    elseif drug_eqn == 1
        dS_dt = r1*x(1)*(1-(x(1)/K1)-(x(2)/K2)) - d*x(1)*x(3);
    end
end