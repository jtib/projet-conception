function[H,f,t]=spectrogramme(s,NPuissDe2,Fs,w,Nrec);

% H: matrice de tfct 
% f: vecteur des frÈquences 
% t: vecteur temps  
% s: signal a analyser
% NPuissDe2: ordre de la TFD pour le calcul de la tfct (defaut: 512)
% Fs: frÈquence d'Èchantillonnage (defaut: 1)
% w: fenetre d'analyse (longueur <= Nfft, defaut: hanning(NPuissDe2))
% Nrec: recouvrement (par defaut: longueur de w /2)

switch nargin
    case 1, NPuissDe2 = 512;Fs=1;w = hanning(512);Nrec=256;
    case 2, Fs=1;w = myhanning(NPuissDe2);Nrec=round(length(w)/2);
    case 3, w = hanning(Nfft);Nrec=round(length(w)/2);
    case 4, Nrec = round(length(w)/2);
end

s = s(:);w = w(:);
N = length(s); % longueur du signal
Nw = length(w);
inc = Nw-Nrec; % increment sur les temps d'analyse b=0 db 2db ...

L = NPuissDe2/2+1;
Nt = fix( (N-Nw)/inc ); % calcul du nombre de tfd a calculer

H = zeros(Nfft/2+1,Nt) ; % matrice pour ranger les resultats de la tfct
t = (0:Nt-1)*inc/Fs; % vecteur temps
f = (0:NPuissDe2/2)/NPuissDe2*Fs; % vecteur des frequences

for k=1:Nt;  % boucle sur les trames
   deb = (k-1)*hop +1; % debut de trame
   fin = deb + Nw -1; % fin de trame
   ts = s(deb:fin).*w; % calcul de la trame  
   X = fft(ts,NPuissDe2); % tfd a l'instant b
 
   H(:,k) = X(1:Nfft/2+1);
end

if nargout == 0;
    imagesc(t,f,db(H));
    axis xy
    xlabel('temps (s)')
    ylabel('frequence (Hz)')
    title('Spectrogramme');
    clear H t f;
end

function xdb =db(x);

xdb = 20*log10(abs(x));