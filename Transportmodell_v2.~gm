* Einfachstes Transportmodell mit Links
* Autor: SH
* Stand: 26.11.2012


set  i Angebotsorte
     j Nachfrageorte
     l Link
     LI(l,i),LJ(l,j);

parameter
     A(i)    Angebot
     N(j)    Nachfrage
     c(l)  Kosten des Transports von i nach j;


$include Transportmodell_v3_Input_Instanz1.inc

variables Z  Zielfunktionswert;
positive variables x Transportmengen;

Equations
Zielfunktion         Das ist die Zielfunktion
Angebot_einhalten(i)   Das Angebot darf nicht überschritten werden
Nachfrage_decken(j)  Die Nachfrage muss befriedigt werden;

Zielfunktion..
     Z =e=   sum(l,c(l)*x(l));

Angebot_einhalten(i)..
     sum(l$LI(l,i), x(l)) =l= A(i);

Nachfrage_decken(j)..
     sum(l$LJ(l,j), x(l)) =g= N(j);

model transportv1 /
                 Zielfunktion
                 , Angebot_einhalten
                 , Nachfrage_decken
                 /;


display A, N, c;

solve transportv1 minimizing Z using lp;

display x.l;


file outputfile1 / 'Transportmengen_v2.txt'/;
put outputfile1;


loop(l,
     loop(i$LI(l,i),
         loop(j$LJ(l,j),
             put l.tl:0, ' ; ' i.tl:0, ' ; ' j.tl:0, ' ; ', x.l(l) /
         );
     );
);

putclose outputfile1;



file outputfile2 / 'Zielfunktionswert_v2.txt'/;
put outputfile2;


put 'Zielfunktionswert:  ',z.l /
put '**************************'

putclose outputfile2;


