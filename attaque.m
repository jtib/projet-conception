function [a] = attaque(fichier_audio)

[Y fs bps]=wavread(fichier_audio);

%Tracé du signal
temps=(0:length(Y)-1)/fs;
figure()
plot(temps,Y)

%On considère que le son est audible à t=0 (en réalité, cela dépend de l'amplitude maximale)
[maxi,t_max]=max(Y);
a=log10(t_max);

end