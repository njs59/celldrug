function [dR_dt] = rhs_R(drug_present, res_drug_death, drug_eqn, x, t)
    params = init_params(drug_present, res_drug_death, drug_eqn);
    r2 = params(6);
    alp21 = params(7);
    K3 = params(8);
    K4 = params(9);
    d2 = params(10);
    
    
    %S = x(1), R = x(2), D = x(3)
    %dR_dt = r2*x(2)*(1-(x(2)/K3)-(x(1)/K4)) - d2*x(2);

    if drug_eqn == 0
        dR_dt = r2*x(2)*(1-(x(2)/K3)-alp21*(x(1)/K4)) - d2*x(2);
    elseif drug_eqn == 1
        dR_dt = r2*x(2)*(1-(x(2)/K3)-alp21*(x(1)/K4)) - d2*x(2)*x(3);
    end
end