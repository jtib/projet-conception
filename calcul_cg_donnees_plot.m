function [cg] = calcul_cg_donnees_plot()

[loc_banjo1,pks_banjo1,c_banjo1]=recherche_pics_freq('./banjo-C.wav','./spectrum_banjo-C.txt');
[loc_banjo2,pks_banjo2,c_banjo2]=recherche_pics_freq('./banjo-C-hi.wav','./spectrum_banjo-C-hi.txt');
[loc_banjo3,pks_banjo3,c_banjo3]=recherche_pics_freq('./banjo-C-lo.wav','./spectrum_banjo-C-lo.txt');
[loc_bass,pks_bass,c_bass]=recherche_pics_freq('./bass-elec-C-h.wav','./spectrum_bass-elec-C-h.txt');
[loc_clarinet1,pks_clarinet1,c_clarinet1]=recherche_pics_freq('./clarinet-C-octave0.wav','./spectrum_clarinet-C-octave0.txt');
[loc_clarinet2,pks_clarinet2,c_clarinet2]=recherche_pics_freq('./clarinet-C-octave2.wav','./spectrum_clarinet-octave2.txt');
[loc_flute1,pks_flute1,c_flute1]=recherche_pics_freq('./flute-alto-C.wav','./spectrum_flute-alto-C.txt');
[loc_flute2,pks_flute2,c_flute2]=recherche_pics_freq('./flute-C-octave1.wav','./spectrum_flute-C-octave1.txt');
[loc_flute3,pks_flute3,c_flute3]=recherche_pics_freq('./flute-C-octave2.wav','./spectrum_flute-C-octave2.txt');
[loc_harpsichord1,pks_harpsichord1,c_harpsichord1]=recherche_pics_freq('./harpsichord-octave0.wav','./spectrum_harpsichord-octave0.txt');
[loc_harpsichord2,pks_harpsichord2,c_harpsichord2]=recherche_pics_freq('./harpsichord-octave2.wav','./spectrum_harpsichord-octave2.txt');
[loc_piano1,pks_piano1,c_piano1]=recherche_pics_freq('./piano-FM-octave1.wav','./spectrum_piano-FM-octave1.txt');
[loc_piano2,pks_piano2,c_piano2,tri1_piano2,tri2_piano2,tri3_piano2]=recherche_pics_freq('./piano-FM-octave0.wav','./spectrum_piano-FM-octave0.txt');
[loc_piano3,pks_piano3,c_piano3,tri1_piano3,tri2_piano3,tri3_piano3]=recherche_pics_freq('./piano-FM-octave2.wav','./spectrum_piano-FM-octave2.txt');
[loc_saxalto1,pks_saxalto1,c_saxalto1]=recherche_pics_freq('./sax-alto-C.wav','./spectrum_sax-alto-C.txt');
[loc_saxalto2,pks_saxalto2,c_saxalto2]=recherche_pics_freq('./saxophone-alto-C-octave1.wav','./spectrum_saxophone-alto-C-octave1.txt');
[loc_saxbari1,pks_saxbari1,c_saxbari1]=recherche_pics_freq('./sax-bari-C-hi.wav','./spectrum_sax-bari-C-hi.txt');
[loc_saxbari2,pks_saxbari2,c_saxbari2]=recherche_pics_freq('./sax-bari-C-lo.wav','./spectrum_sax-bari-C-lo.txt');

cg=[(c_banjo1+c_banjo2+c_banjo3)/3,c_bass,(c_clarinet1+c_clarinet2)/2,(c_flute1+c_flute2+c_flute3)/3,(c_harpsichord1+c_harpsichord2)/2,(c_piano1+c_piano2+c_piano3)/3,(c_saxalto1+c_saxalto2)/2,(c_saxbari1+c_saxbari2)/2];

close;

figure()
plot(cg,'+')

end