set i / 
i1
i2
i3
/

j / 
j1
j2
j3
j4
/

l / 
l1
l2
l3
l4
l5
l6
l7
l8
l9
l10
l11
l12
/;

LI(l,i) = no;
LJ(l,j) = no;

LI( 'l1', 'i1') = yes;
LJ( 'l1', 'j1') = yes;

LI( 'l2', 'i1') = yes;
LJ( 'l2', 'j2') = yes;

LI( 'l3', 'i1') = yes;
LJ( 'l3', 'j3') = yes;

LI( 'l4', 'i1') = yes;
LJ( 'l4', 'j4') = yes;

LI( 'l5', 'i2') = yes;
LJ( 'l5', 'j1') = yes;

LI( 'l6', 'i2') = yes;
LJ( 'l6', 'j2') = yes;

LI( 'l7', 'i2') = yes;
LJ( 'l7', 'j3') = yes;

LI( 'l8', 'i2') = yes;
LJ( 'l8', 'j4') = yes;

LI( 'l9', 'i3') = yes;
LJ( 'l9', 'j1') = yes;

LI( 'l10', 'i3') = yes;
LJ( 'l10', 'j2') = yes;

LI( 'l11', 'i3') = yes;
LJ( 'l11', 'j3') = yes;

LI( 'l12', 'i3') = yes;
LJ( 'l12', 'j4') = yes;



Parameter
  A(i) /
i1  20.0
i2  25.0
i3  21.0
/


N(j) /
j1  15.0
j2  17.0
j3  22.0
j4  12.0
/


c(l) /
l1  6.0
l2  2.0
l3  6.0
l4  7.0
l5  4.0
l6  9.0
l7  5.0
l8  3.0
l9  8.0
l10  8.0
l11  1.0
l12  6.0
/

;
