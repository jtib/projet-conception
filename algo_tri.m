function [instrument1,instrument2] = algo_tri(fichier_a_tester,spectre_a_tester,tri_utiles)

[loc,pks,cgravite_spectral,tri_test1,tri_test2,tri_test3] = recherche_pics_freq(fichier_a_tester,spectre_a_tester);

[tri1,tri2,tri3]=calcul_tristimuli();
N=length(tri1);
tri_moins_test=zeros([1 N]);

switch(tri_utiles)
  case 12
   for i=1:N
    tri_moins_test(i)=sqrt((tri1(i)-tri_test1)^2+(tri2(i)-tri_test2)^2);
   end
  case 13
   for i=1:N
    tri_moins_test(i)=sqrt((tri1(i)-tri_test1)^2+(tri3(i)-tri_test3)^2);
   end
  case 23
   for i=1:N
    tri_moins_test(i)=sqrt((tri2(i)-tri_test2)^2+(tri3(i)-tri_test3)^2);
   end
end

[tri_sort,ind]=sort(tri_moins_test)

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