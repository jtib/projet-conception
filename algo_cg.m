function [instrument1,instrument2] = algo_cg(fichier_a_tester,spectre_a_tester)

[loc,pks,cgravite_spectral] = recherche_pics_freq(fichier_a_tester,spectre_a_tester);

cg=calcul_cg_donnees_plot();
cg_moins_test=zeros([1 length(cg)]);

for i=1:length(cg)
 cg_moins_test(i)=abs(cg(i)-cgravite_spectral);
end

[cg_sort,ind]=sort(cg_moins_test)

switch(ind(1))
  case 1
    instrument1='banjo';
   case 2
    instrument1='basse électrique';
   case 3
    instrument1='clarinette';
   case 4
    instrument1='flûte alto';
   case 5
    instrument1='harpe';
   case 6
    instrument1='piano';
   case 7
    instrument1='saxophone alto';
   otherwise
    instrument1='saxophone baryton';
end

switch(ind(2))
  case 1
    instrument2='banjo';
   case 2
    instrument2='basse électrique';
   case 3
    instrument2='clarinette';
   case 4
    instrument2='flûte alto';
   case 5
    instrument2='harpe';
   case 6
    instrument2='piano';
   case 7
    instrument2='saxophone alto';
   otherwise
    instrument2='saxophone baryton';
end