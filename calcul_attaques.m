function [attaques] = calcul_attaques()

a_banjo1=attaque('./banjo-C.wav');
a_banjo2=attaque('./banjo-C-hi.wav');
a_banjo3=attaque('./banjo-C-lo.wav');
a_bass=attaque('./bass-elec-C-h.wav');
a_clarinet1=attaque('./clarinet-C-octave0.wav');
a_clarinet2=attaque('./clarinet-C-octave2.wav');
a_flute1=attaque('./flute-alto-C.wav');
a_flute2=attaque('./flute-C-octave1.wav');
a_flute3=attaque('./flute-C-octave2.wav');
a_harpsichord1=attaque('./harpsichord-octave0.wav');
a_harpsichord2=attaque('./harpsichord-octave2.wav');
a_piano1=attaque('./piano-FM-octave1.wav');
a_piano2=attaque('./piano-FM-octave2.wav');
a_piano3=attaque('./piano-FM-octave0.wav');
a_saxalto1=attaque('./sax-alto-C.wav');
a_saxalto2=attaque('./saxophone-alto-C-octave1.wav');
a_saxbari1=attaque('./sax-bari-C-hi.wav');
a_saxbari2=attaque('./sax-bari-C-lo.wav');

attaques=[(a_banjo1+a_banjo2+a_banjo3)/3,a_bass,(a_clarinet1+a_clarinet2)/2,(a_flute1+a_flute2+a_flute3)/3,(a_harpsichord1+a_harpsichord2)/2,(a_piano1+a_piano2+a_piano3)/3,(a_saxalto1+a_saxalto2)/2,(a_saxbari1+a_saxbari2)/2]

figure()
plot(attaques,'+');

end