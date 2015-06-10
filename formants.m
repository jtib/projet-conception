function []=formants(fichier_audio)

close all;

[Y,fs,bps]=wavread(fichier_audio);


% affichage du signal
N = length(Y);
t = (0:N-1)/fs;
figure(1)
plot(t,Y)

figure(2)
spectrogramme(Y,2048,fs)
title('la corde vide alto')
