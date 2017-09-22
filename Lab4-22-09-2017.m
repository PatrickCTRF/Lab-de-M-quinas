% Maria Milena         173906  
% Patrick de Carvalho  175480
% Rafael Pereira       176219
% Rafael Nogueira      147704

clc
clear all
close all
% Experimento 4 - Gerador de indução


v1 = [44 62 80 100 109 119 130 141 150 163 172 180 190 200 210 220 232 241 250];
i_fi = [0.546 0.78 1 1.3 1.43 1.6 1.77 1.93 2.12 2.4 2.65 2.81 3.23 3.58 3.95 4.52 4.84 5.28 6.37];

figure()
plot(i_fi, v1, 'm.-');
title('Curva de magnetização');
xlabel('Corrente de campo [A]');
ylabel('Tensão no estator [V]');
grid on;


c = [20 25 30]*1e-6; %em micro Faradays
V1 = [24.4 185 214];
I1 = [0.310 3.1 4.33];
I1f = I1/(sqrt(3));
f1 = [60 59.8 59.9];
w = 2*pi*f1;
tensao = [0 250];
for i=1: 3
    Xc(i) = 1/(w(i)*c(i));
    I1_teor (i) = (250*sqrt(3))/Xc (i);
end

ii(1)=0;
ii(2)=I1_teor (1);
ii2(1)=0;
ii2(2)=I1_teor (2);
ii3(1)=0;
ii3(2)=I1_teor (3);

figure()
plot(i_fi, v1, ii, tensao, ii2, tensao, ii3, tensao);

ylabel('Tensão no estator [V]');
xlabel('Corrente de campo [A]');
grid on;

% Pelo gráfico encontramos o ponto I = 0.78A e V = 62V, usado para cálculo
% da Capacitância crítica

Xc_crit = sqrt(3)*62 / (0.78);
C_crit = 1/(Xc_crit*377);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% CURVA DE REGULAÇÃO%%%%%%%%%%%%%%%%%%%

R_load = [26.66 40 80 120 inf];
V1_r = [148 175 194 201 214];
I1_r = [6.47 5.84 4.56 4.42 4.33];
f1_r = [56.7 57.6 59 59 59.9];

figure()
plot(I1_r, V1_r, 'm.-');
title('Curva de regulação');
xlabel('Corrente do estator [A]');
ylabel('Tensão no estator [V]');
grid on;

figure()
plot(I1_r, f1_r, 'm.-');
title('Frequência em função da corrente');
xlabel('Corrente do estator [A]');
ylabel('Frequência [Hz]');
grid on;



