function [dS_dt] = rhs_S(drug_present, res_drug_death, drug_eqn, x, t)
    params = init_params(drug_present, res_drug_death, drug_eqn);
    r1 = params(1);
    alp12 = params(2);
    K1 = params(3);
    K2 = params(4);
    d1 = params(5);
    
    %S = x(1), R = x(2), D = x(3)
    if drug_eqn == 0
        dS_dt = r1*x(1)*(1-(x(1)/K1)-alp12*(x(2)/K2)) - d1*x(1);
    elseif drug_eqn == 1
        dS_dt = r1*x(1)*(1-(x(1)/K1)-alp12*(x(2)/K2)) - d1*x(1)*x(3);
    end
end