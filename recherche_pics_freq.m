function [] = recherche_pics_freq(spectre,fichier_audio)

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
figure()
plot(freq(1:length(result)),result); % frequence
freq_fond=251; %faut-il prendre le 440 du la auquel le piano est accorde ou le pic a 251 qui correspond a la note jouee ?
P_str=[];
npic=1; % numero de pic
for fh=freq_fond:freq_fond:36*freq_fond % 36 pics pour couvrir a peu pres les 20000Hz
% %f = (0:Nfft/2)/Nfft*Fe;
% % indice k=f*Nfft/FÈ + 1;
% ind=round(f1*Nfft/Fe+1); 

[fpic valpic ] = cherche_pic(fh,Nfft,Fe,result);
    % on ne veut pas tenir compte des harmoniques negatives pour le centre
    % de gravite spectral
if (valpic <0) 
    valpic=0 ; 
end

freqp(npic)=fpic;
amp(npic)=valpic;
npic=npic+1;
% concatener les pics et leurs frequences

    P_str2=[num2str(valpic), ',', num2str(fpic)];
    P_str=[P_str '\r\n' P_str2];

end









%Calcul du centre de gravité

