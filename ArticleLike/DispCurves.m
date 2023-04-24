clc;
close all;
fh = figure();
fh.WindowState = 'maximized';

data = load('newDzeta.txt');
x = data(:,1);
dzeta = data(:,3);


plot(x, dzeta,  '.', 'markerSize', 15);

xlabel('hf ì/ñ');

set(gca,'FontSize', 65, 'FontName', 'Times New Roman')