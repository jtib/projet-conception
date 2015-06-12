function [loc,pks,c,tristimulus1,tristimulus2,tristimulus3] = recherche_pics_freq(fichier_audio,spectre)

close all;

[freq_spectre_norm,spectre_norm]=normal(fichier_audio,spectre);

%Recherche des pics et de la fréquence associée
P=findpeaksG(freq_spectre_norm,spectre_norm,0,-0.5,5,5);
loc=P(:,2);
pks=P(:,3)';

% Centre de gravite
c=sum(loc'.*pks)/sum(pks);
% Tristimuli
tristimulus1=pks(1)/sum(pks);
tristimulus2=(pks(2)+pks(3)+pks(4))/sum(pks);
tristimulus3=1-tristimulus1-tristimulus2;


end

