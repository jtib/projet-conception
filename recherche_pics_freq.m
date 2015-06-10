function [loc,pks,cgravite_spectral] = recherche_pics_freq(fichier_audio,spectre)

close all;

%"Lecture" du fichier audio : vecteur, fréquence d'échantillonnage, bits par échantillon
[Y, fs, bps] = wavread(fichier_audio);

%Spectre (fenêtre de Hanning)
%Récupération des données d'Audacity
spectre = load(spectre);
freq=spectre(:,1);
niv=spectre(:,2);
%figure()
%plot(freq,niv,'+');


%ce serait quand meme mieux de faire ça proprement, mais en obtenant autre chose que des etoiles a la moindre fft...

%Normalisation et trace
val_max=max(20*log10(abs(niv)));
figure()
plot(freq,20*log10(abs(niv))/val_max,'+'); % f
grid
xlabel('Fréquence');
ylabel('Niveau (dB)');
title('Spectre normalisé du signal (avec fenêtre de Hanning)');

%Recherche des pics et de la fréquence associée
result=20*log10(abs(niv))/val_max;
% prendre le spectre jusqu'a 25000 Hz (un peu large pour certains) et le tracer
result=result(1:round(20000*512/fs));
freq_result=freq(1:length(result));
figure()
plot(freq_result,result); % frequence
P=findpeaksG(freq_result,result,0,-0.5,5,5);
loc=P(:,2);
pks=P(:,3)';

% Centre de gravite
cgravite_spectral=sum(loc'.*pks)/sum(pks);
% calcul des tri-stimulus
%tristimulus1=pks(1)/sum(pks);% A1/sigma(Ak)
%tristimulus2=(pks(2)+pks(3)+pks(4))/sum(pks); % A2+A3+A4/sigma(Ak)
%tristimulus3=1-tristimulus1-tristimulus2; % sigma(Ak,k>4)/sigma(Ak)


end

