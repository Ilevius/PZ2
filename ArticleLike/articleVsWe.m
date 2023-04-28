clc;
close all;
fh = figure();
fh.WindowState = 'maximized';

data = load('newDzeta.txt');
x = data(:,1);
dzeta = data(:,3);


plot(x, dzeta,  '.', 'markerSize', 30);
xlim([1 11])
ylim([0 50])
daspect([1 3.68 1])
xlabel('hf κμ/ρ');
grid on

set(gca,'FontSize', 65, 'FontName', 'Times New Roman')