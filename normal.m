function [freq_spectre_norm,spectre_norm] = normal(fichier,spectre)

%"Lecture" du fichier audio : vecteur, fréquence d'échantillonnage, bits par échantillon
[Y, fs, bps] = wavread(fichier);

%Spectre (fenêtre de Hanning)
%Récupération des données d'Audacity (fréquence et niveau)
spectre=load(spectre);
freq=spectre(:,1);
niv=spectre(:,2);

%Trace du spectre
figure(1)
plot(freq,niv);
xlabel('Fréquence');
ylabel('Niveau (dB)');
title('Spectre du signal (avec fenêtre de Hanning)');

%Normalisation et nouveau trace
val_max=max(abs(niv));
spectre_norm=niv/val_max+1;
spectre_norm=spectre_norm(1:round(20000*512/fs));
freq_spectre_norm=freq(1:length(spectre_norm));
figure(2)
plot(freq_spectre_norm,spectre_norm);
title('Spectre normalisé');