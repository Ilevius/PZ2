clc;
close all;
fh = figure();
fh.WindowState = 'maximized';

data = load('newDzeta.txt');
x = data(:,1);
dzeta = data(:,2);


plot(x, dzeta,  '.', 'markerSize', 15);
ylim([0 1])
xlabel('hf κμ/ρ');
grid on

set(gca,'FontSize', 65, 'FontName', 'Times New Roman')