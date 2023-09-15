%% Set-up
% drug_present 0 for no drug 1 for drug
drug_present = 1;

% res_drug_death 0 for no death in resistant population due to drug, 1 for
% death in resistant population due to drug
res_drug_death = 1;

% drug_eqn if 0 then we have a constant amount of drug if 1 then dynamic amount of drug 
drug_eqn = 0;

%% Data read in
co_culture = csvread('exp1_data_co_manual_average_MATLAB.csv');

mono_culture = csvread('exp1_data_mono_clipped_low_manual_MATLAB.csv');

time = co_culture(1:13,2);
co_culture_red = co_culture(1:13,1);
co_culture_green = co_culture(14:26,1);
mono_culture_red = mono_culture(1:13,1);
mono_culture_green = mono_culture(14:26,1);


%% IC 
if drug_eqn == 1
    x0 = [100, 10, 1, 100];
else
    x0 = [7,5.5, 0];
    %x0 = [9,1,0];
end


%% Running of solver
tmin = 0;
tmax = 500;
tspan = [tmin tmax];


%[t,x] = ode45(@(t,x) cell_drug(t,x,drug_present,drug_eqn), tspan, x0);

[t,x] = ode45(@(t,x) cell_drug(t, x, drug_present, res_drug_death, drug_eqn), tspan, x0);

figure(1)
plot(t,x(:,1),LineWidth=1.5)
hold on
plot(t,x(:,2),LineWidth=1.5)
plot(t,x(:,3),LineWidth=1.5)
hold off
fontsize(12,"points")
xlabel('Time (hours)');
ylabel('Confluence');


hold on 
%plot(time, co_culture_green,'g',Marker='x',LineWidth=1.25,LineStyle=':')
%plot(time, co_culture_red, 'r',Marker='x',LineWidth=1.25,LineStyle=':')
legend('Susceptible cells', 'Resistant cells', 'Excess Acid concentration', ...
    'Experimental Susceptible', 'Experimental Resistant', 'Location','best')

%plot(time, mono_culture_green,'g')
%plot(time, mono_culture_red, 'r')
hold off


%store_S = zeros(61,5);
%store_S(:,1) = x(:,1);
%figure(2)
%style= {'-k','--b',':y'};
%hold on
%for k= 1:6
%    if k <= 5
%        plot(t,store_S(:,k), 'LineWidth',1)
%    else
%        plot(t,x(:,2),"Color",'k','LineStyle','--', 'LineWidth',1)
%    end
%end
%xlim([0, 200])
%ylim([0, 100])
%legend('d3 = 0.0008','d3 = 0.0009', 'd3 = 0.001', 'd3 = 0.0011', 'd3 = 0.0012', 'Resistant')



%plot(t, x(:,2), 'k', '--', t,store_S(:,1), t,store_S(:,2), t,store_S(:,3), t,store_S(:,4), t,store_S(:,5))
%ylim([0 100])
%legend('d3 = 0.0008','d3 = 0.0009', 'd3 = 0.001', 'd3 = 0.0011', 'd3 = 0.0012')




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
eqns = 3 + drug_eqn;
dx_dt = zeros(eqns,1);

sum_dx_dt = 0;

for i = 1:eqns
    dS_dt = rhs_S(drug_present, res_drug_death, drug_eqn, x, t);
    dR_dt = rhs_R(drug_present, res_drug_death, drug_eqn, x, t);
    dA_dt = rhs_A(drug_present, res_drug_death, drug_eqn, x, t);
    dx_dt(1) = dS_dt;
    dx_dt(2) = dR_dt;
    dx_dt(3) = dA_dt;
    if drug_eqn == 1
        dD_dt = rhs_S(x, t);
        dx_dt(4) = dD_dt;
    end
    sum_dx_dt = dS_dt + dR_dt;
        
end

if sum_dx_dt < 1e-6
    return
end

end
