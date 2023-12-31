co_culture = csvread('exp1_data_co_manual_average_MATLAB.csv');

mono_culture = csvread('exp1_data_mono_clipped_low_manual_MATLAB.csv');

time = co_culture(1:13,2);
co_culture_red = co_culture(1:13,1);
co_culture_green = co_culture(14:26,1);
mono_culture_red = mono_culture(1:13,1);
mono_culture_green = mono_culture(14:26,1);

figure(1)
plot(time, co_culture_green,'g')
hold on
plot(time, co_culture_red, 'r')
plot(time, mono_culture_green,'g','LineStyle','--')
plot(time, mono_culture_red, 'r','LineStyle','--')
hold off

figure(2)
plot(time, mono_culture_green,'g')
hold on
plot(time, mono_culture_red, 'r')
hold off