%% Set-up
% drug_present 0 for no drug 1 for drug
drug_present = 1;

% res_drug_death 0 for no death in resistant population due to drug, 1 for
% death in resistant population due to drug
res_drug_death = 1;

% drug_eqn if 0 then we have a constant amount of drug if 1 then dynamic amount of drug 
drug_eqn = 0;

%% IC 
if drug_eqn == 1
    x0 = [100, 10, 100];
else
    x0 = [90,5];
end


%% Running of solver
tmin = 0;
tmax = 10000;
tspan = [tmin tmax];


%[t,x] = ode45(@(t,x) cell_drug(t,x,drug_present,drug_eqn), tspan, x0);

[t,x] = ode45(@(t,x) cell_drug(t, x, drug_present, res_drug_death, drug_eqn), tspan, x0);

plot(t,x(:,1), t,x(:,2))

%% Outputs
%derivatives = zeros(length(t),N);
%derivative_l2_norm = zeros(length(t),1);
%for i = 1:length(t)
%    derivatives = ext_smol(t(i), n(i,1:N));
%    derivative_l2_norm(i) = norm(derivatives,2);
%end


%save('array_n.mat','n')


%output_statistics = sum_totals(n,t);

%population_plots(n,t,tspan, derivative_l2_norm)



%% Functions
function [dx_dt]  = cell_drug(t,x, drug_present, res_drug_death, drug_eqn)
eqns = 2 + drug_eqn;
dx_dt = zeros(eqns,1);

sum_dx_dt = 0;

for i = 1:eqns
    dS_dt = rhs_S(drug_present, res_drug_death, drug_eqn, x, t);
    dR_dt = rhs_R(drug_present, res_drug_death, drug_eqn, x, t);
    dx_dt(1) = dS_dt;
    dx_dt(2) = dR_dt;
    if drug_eqn == 1
        dD_dt = rhs_S(x, t);
        dx_dt(3) = dD_dt;
    end
    sum_dx_dt = dS_dt + dR_dt;
        
end

if sum_dx_dt < 1e-6
    return
end

end
