function  J_a = jacobian(theta1,theta2,theta3,theta4)
d1=0.077;
a2=0.13;
a3=0.124;
a4=0.126;
phi=atan2(0.128,0.024);
 %syms theta1 theta2 theta3 theta4 d1 a2 a3 a4 d1 phi

A01 = ([cos(theta1)    ,0       , 1*sin(theta1) , 0   ;
        sin(theta1), 0                     ,-1*cos(theta1)         , 0    ;
            0      , 1                     ,0                      ,  d1              ;
            0      , 0                     , 0                     , 1              ]);
A12 = ([cos(theta2+phi) ,-1*sin(theta2+phi) ,0 , a2*cos(theta2+phi)    ;
        sin(theta2+phi) , 1*cos(theta2+phi) ,0 , a2*sin(theta2+phi)    ;
            0      , 0           , 1            , 0               ;
            0      , 0                     , 0                     ,      1         ]);
A23 = ([cos(theta3-phi) ,-1*sin(theta3-phi) , 0 , a3*cos(theta3-phi)    ;
        sin(theta3-phi) , 1*cos(theta3-phi) ,0 , a3*sin(theta3-phi)    ;
            0      , 0           , 1            , 0               ;
            0      , 0                     , 0                     , 1              ]);
A34 = ([cos(theta4) ,-1*sin(theta4) , 0 , a4*cos(theta4)    ;
        sin(theta4) , 1*cos(theta4) ,0 , a4*sin(theta4)    ;
            0      , 0           , 1            , 0               ;
            0      , 0                     , 0                     , 1              ]);

A02 = (A01*A12);
A03 = (A01*A12*A23);
A04 = (A01*A12*A23*A34);
        
z0 = [0 ;0 ; 1];
p0 = [0 ;0 ; 0];
z1 = [A01(1,3);A01(2,3);A01(3,3)];
z2 = [A02(1,3);A02(2,3);A02(3,3)];
z3 = [A03(1,3);A03(2,3);A03(3,3)];
z4 = [A04(1,3);A04(2,3);A04(3,3)];

p1 = [A01(1,4);A01(2,4);A01(3,4)];
p2 = [A02(1,4);A02(2,4);A02(3,4)];
p3 = [A03(1,4);A03(2,4);A03(3,4)];
p4 = [A04(1,4);A04(2,4);A04(3,4)];

% J(q) = [ z0*(p3-p0) z1*(p3-p1) z2*(p3-p2)]
t1 = vector_x(z0,(p4-p0));
t2 = vector_x(z1,(p4-p1));
t3 = vector_x(z2,(p4-p2));
t4 = vector_x(z3,(p4-p3));

J  = ([t1 t2 t3 t4;z0 z1 z2 z3]);
J(5,1:4) = [0,-1,-1,-1]
J_a = [J(1,1:4);J(2,1:4);J(3,1:4);J(5,1:4)]

