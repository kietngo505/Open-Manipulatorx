function Trajectory(handles)
syms t;
%%Thong so
A2     = 0.13;
A3     = 0.124;
a4     = 0.126;
d1     = 0.077;
alpha1 = pi/2;
phi=atan2(0.128,0.024);
%theta1 = str2double(get(handles.edit_theta1,'String'))*pi/180;
%theta2 = str2double(get(handles.edit_theta2,'String'))*pi/180;
%theta3 = str2double(get(handles.edit_theta3,'String'))*pi/180;
%theta4 = str2double(get(handles.edit_theta4,'String'))*pi/180;
x1 = str2double(get(handles.edit_x1,'String'));
y1 = str2double(get(handles.edit_y1,'String'));
z1 = str2double(get(handles.edit_z1,'String'));
pitch1 = str2double(get(handles.edit_pitch1,'String'))*pi/180;
x2 = str2double(get(handles.edit_x2,'String'));
y2 = str2double(get(handles.edit_y2,'String'));
z2 = str2double(get(handles.edit_z2,'String'));
pitch2 = str2double(get(handles.edit_pitch2,'String'))*pi/180;
amax = str2double(get(handles.edit_amax,'String'));
vmax = str2double(get(handles.edit_vmax,'String'));
pmax = ((x1 - x2)^2+(y1 - y2)^2+(z1 - z2)^2)^(1/2);
handles.edit_pmax.String  = num2str(round(pmax,3));
%% Graph
t1 = vmax/amax;
t2 = (pmax - (amax/2)*t1^2)/vmax +t1*3/2;
pxy = sqrt((x2-x1)^2+(y2-y1)^2);
pz_f = sqrt((z2-z1)^2);
beta_z=atan2((z2-z1),pxy);
if (t2 <= 2*t1)
    warndlg('Please type different input!' )
    end
%0 -> t1
po1 = (amax*t^2)/2;
v1 = amax*t;
a1 = amax;
%t1 -> t2-t1
po2 = vmax*(t-t1/2);
v2 = vmax;
a2 = 0;
%t2-t1 -> t2
po3 = pmax -amax*(t-t2)^2/2;
v3 = amax*(t2-t);
a3 = -amax;
%loop
tf_l = linspace(0,t2,150);
pitch_l = linspace (pitch1,pitch2,150);
step = 1;
for i = 1:(150/step)
    pitch = pitch_l(i*step);
    if (tf_l(i*step)<=t1)
        p = subs(po1,t,tf_l(i*step));
        v = subs(v1,t,tf_l(i*step));
        a = subs(a1,t,tf_l(i*step));
    elseif (tf_l(i*step)>t1) && (tf_l(i*step)<t2-t1)
        p = subs(po2,t,tf_l(i*step));
        v = subs(v2,t,tf_l(i*step));
        a = subs(a2,t,tf_l(i*step));
    elseif (tf_l(i*step)>t2-t1) && (tf_l(i*step)<=t2)
        p = subs(po3,t,tf_l(i*step));
        v = subs(v3,t,tf_l(i*step));
        a = subs(a3,t,tf_l(i*step));
    end
    p_l(i) = p;
    v_l(i) = v;
    a_l(i) = a;
    t_l(i) = tf_l(i*step);
    if(pxy==0)
        pxy=1;
    end
    if(pz_f==0)
        pz_f=1
    end
    px = (p*cos(beta_z)/pxy)*(x2-x1); 
    py = (p*cos(beta_z)/pxy)*(y2-y1);
    x = double(x1+px);
    y = double(y1+py);
    %if (pitch2-pitch1 <0)
        %z_n = sqrt(2*a4^2-2*a4^2*cos(pitch));
    %else 
        %z_n = -sqrt(2*a4^2-2*a4^2*cos(pitch));
    %end
    pz = (p*sin(beta_z));
    z = double(z1+pz);
r = sqrt(x^2+y^2);
%p_cal=round(p,4)
theta1_first = atan2(y1,x1);
theta1_final = atan2(y2,x2);
%if (theta1_first < theta1_final )
    %C = acos((2*(r^2)-(p^2))/(2*(r^2)));
%else 
    %C = acos((2*(r^2)-(p^2))/(2*(r^2)));
%end
r3 = r-a4*cos(-pitch);
z3 = z-a4*sin(-pitch)-d1;
theta1_new = atan2(y,x);
theta3_new = acos(((A2^2+A3^2)-(z3^2+r3^2))/(2*A2*A3))+phi-pi ;
if (cos(pi-phi+theta3_new)>1)|(cos(pi-phi+theta3_new)<-1)
        warndlg('Out of bound. Please type different input!' )
    end
theta2_new = atan2(-(r3*(A2*sin(phi)+A3*sin(theta3_new))-z3*(A2*cos(phi)+A3*cos(theta3_new))),(r3*(A2*cos(phi)+A3*cos(theta3_new))+z3*(A2*sin(phi)+A3*sin(theta3_new))));
theta4_new = -pitch-theta2_new-theta3_new;
x_dot = px/(t2/150);
y_dot = py/(t2/150);
z_dot = pz/(t2/150);
pitch_dot = 0;
J_a = jacobian(theta1_new,theta2_new,theta3_new,theta4_new)
T = [x_dot,y_dot,z_dot,pitch_dot]
theta_dot = T*J_a^-1
theta1_l(i)= theta1_new;
theta2_l(i)= theta2_new;
theta3_l(i)= theta3_new;
theta4_l(i)= theta4_new;
%if i~=1
    %theta1dot_l(i)=(theta1_l(i)-theta1_l(i-1))/(t2/150);
    %theta2dot_l(i)=(theta2_l(i)-theta2_l(i-1))/(t2/150);
    %theta3dot_l(i)=(theta3_l(i)-theta3_l(i-1))/(t2/150);
    %theta4dot_l(i)=(theta4_l(i)-theta4_l(i-1))/(t2/150);
%end
%theta1dot_l(1) = 0;
%theta2dot_l(1) = 0;
%theta3dot_l(1) = 0;
%theta4dot_l(1) = 0;
theta1dot_l(i)=double(theta_dot(1));
theta2dot_l(i)=double(theta_dot(2));
theta3dot_l(i)=double(theta_dot(3));
theta4dot_l(i)=double(theta_dot(4));
set(handles.edit_theta1,'String',num2str(double(theta1_new)*180/pi));
set(handles.edit_theta2,'String',num2str(double(theta2_new)*180/pi));
set(handles.edit_theta3,'String',num2str(double(theta3_new)*180/pi));
set(handles.edit_theta4,'String',num2str(double(theta4_new)*180/pi));
%% DH_Table
a     = [0      ; A2              ; A3              ; a4    ];
alpha = [alpha1      ; 0            ;0                ; 0     ];
d     = [d1      ; 0               ; 0               ; 0     ];
theta = [theta1_new ; theta2_new + phi ; theta3_new - phi ; theta4_new];

%% HOMOGENEOUS_TRANSFORMATION
A0_1 = DH_matrix(a(1),alpha(1),d(1),theta(1)) ;
A1_2 = DH_matrix(a(2),alpha(2),d(2),theta(2)) ;
A2_3 = DH_matrix(a(3),alpha(3),d(3),theta(3)) ;
A3_4 = DH_matrix(a(4),alpha(4),d(4),theta(4)) ;
A0_2= A0_1*A1_2;
A0_3= A0_1*A1_2*A2_3;
A0_4= A0_1*A1_2*A2_3*A3_4;   

%% CALCULATE X,Y,Z,ROLL,PITCH,YAW
p0 = [0; 0; 0];
[p1, o1] = P_org(A0_1,p0);
[p2, o2] = P_org(A0_2,p0);
[p3, o3] = P_org(A0_3,p0);
[p4, o4] = P_org(A0_4,p0);

px_a(i)=p4(1);
py_a(i)=p4(2);
pz_a(i)=p4(3);

handles.display_x.String = sprintf('%.3f',p4(1));
handles.display_y.String = sprintf('%.3f',p4(2));
handles.display_z.String = sprintf('%.3f',p4(3));
handles.display_roll.String = sprintf('%.2f',o4(1)*180/pi);
handles.display_pitch.String = sprintf('%.2f',o4(2)*180/pi);
handles.display_yaw.String = sprintf('%.2f',o4(3)*180/pi);

%% PLOT COORDINATE AND LINK
R1=[ cos(double(theta1_new)), -sin(double(theta1_new)), 0,0;
    sin(double(theta1_new)), cos(double(theta1_new)), 0,0;
    0,          0,       1,0;
    0,0,0,1];
R2=[cos(-double(theta2_new)), 0, sin(-double(theta2_new)), 0;
    0, 1, 0, 0;
    -sin(-double(theta2_new)), 0, cos(-double(theta2_new)),0.077;
    0, 0, 0, 1];
R3=[cos(-theta3_new), 0, sin(-theta3_new), 0.024;
    0, 1, 0, 0;
    -sin(-theta3_new), 0, cos(-theta3_new),0.128;
    0, 0, 0, 1];
R4=[cos(-theta4_new), 0, sin(-theta4_new), 0.124;
    0, 1, 0, 0;
    -sin(-theta4_new), 0, cos(-theta4_new), 0;
    0, 0, 0, 1];

cla(handles.axes_arm,'reset');
hold(handles.axes_arm,'on');
grid(handles.axes_arm,'on');

cla(handles.axes_p,'reset');
hold(handles.axes_p,'on');
grid(handles.axes_p,'on');
%
cla(handles.axes_v,'reset');
hold(handles.axes_v,'on');
grid(handles.axes_v,'on');
%
cla(handles.axes_a,'reset');
hold(handles.axes_a,'on');
grid(handles.axes_a,'on');
%
cla(handles.axes_theta1,'reset');
hold(handles.axes_theta1,'on');
grid(handles.axes_theta1,'on');
cla(handles.axes_theta2,'reset');
hold(handles.axes_theta2,'on');
grid(handles.axes_theta2,'on');
cla(handles.axes_theta4,'reset');
hold(handles.axes_theta4,'on');
grid(handles.axes_theta4,'on');
cla(handles.axes_theta3,'reset');
hold(handles.axes_theta3,'on');
grid(handles.axes_theta3,'on');
cla(handles.axes_theta1dot,'reset');
hold(handles.axes_theta1dot,'on');
grid(handles.axes_theta1dot,'on');
cla(handles.axes_theta2dot,'reset');
hold(handles.axes_theta2dot,'on');
grid(handles.axes_theta2dot,'on');
cla(handles.axes_theta4dot,'reset');
hold(handles.axes_theta4dot,'on');
grid(handles.axes_theta4dot,'on');
cla(handles.axes_theta3dot,'reset');
hold(handles.axes_theta3dot,'on');
grid(handles.axes_theta3dot,'on');
%

xlabel(handles.axes_theta1,'t');
ylabel(handles.axes_theta1,'value');
plot(handles.axes_theta1,t_l,theta1_l,'lineWidth',0.5);
xlabel(handles.axes_theta2,'t');
ylabel(handles.axes_theta2,'value');
plot(handles.axes_theta2,t_l,theta2_l,'lineWidth',0.5);
xlabel(handles.axes_theta4,'t');
ylabel(handles.axes_theta4,'value');
plot(handles.axes_theta4,t_l,theta4_l,'lineWidth',0.5);
xlabel(handles.axes_theta3,'t');
ylabel(handles.axes_theta3,'value');
plot(handles.axes_theta3,t_l,theta3_l,'lineWidth',0.5);
xlabel(handles.axes_theta1dot,'t');
ylabel(handles.axes_theta1dot,'value');
plot(handles.axes_theta1dot,t_l,theta1dot_l,'lineWidth',0.5);
xlabel(handles.axes_theta2dot,'t');
ylabel(handles.axes_theta2dot,'value');
plot(handles.axes_theta2dot,t_l,theta2dot_l,'lineWidth',0.5);
xlabel(handles.axes_theta4dot,'t');
ylabel(handles.axes_theta4dot,'value');
plot(handles.axes_theta4dot,t_l,theta4dot_l,'lineWidth',0.5);
xlabel(handles.axes_theta3dot,'t');
ylabel(handles.axes_theta3dot,'value');
plot(handles.axes_theta3dot,t_l,theta3dot_l,'lineWidth',0.5);
%
xlabel(handles.axes_p,'t');
ylabel(handles.axes_p,'p');
plot(handles.axes_p,t_l,p_l,'lineWidth',0.5);
%
xlabel(handles.axes_v,'t');
ylabel(handles.axes_v,'v');
plot(handles.axes_v,t_l,v_l,'lineWidth',0.5);
%
xlabel(handles.axes_a,'t');
ylabel(handles.axes_a,'a');
plot(handles.axes_a,t_l,a_l,'lineWidth',0.5);
if handles.checkbox_coor0.Value
    plot_coordinate(handles,p0(1),p0(2),p0(3),0.3,0.3,0.3,0,0,0,0);
end
if handles.checkbox_coor1.Value
    plot_coordinate(handles,p1(1),p1(2),p1(3),0.3,0.3,0.3,1,o1(1),o1(2),o1(3));
end
if handles.checkbox_coor2.Value
    plot_coordinate(handles,p2(1),p2(2),p2(3),0.3,0.3,0.3,2,o2(1),o2(2),o2(3));
end
if handles.checkbox_coor3.Value
    plot_coordinate(handles,p3(1),p3(2),p3(3),0.3,0.3,0.3,3,o3(1),o3(2),o3(3));
end
if handles.checkbox_coor4.Value
    plot_coordinate(handles,p4(1),p4(2),p4(3),0.3,0.3,0.3,4,o4(1),o4(2),o4(3));
end

plot3(handles.axes_arm,px_a,py_a,pz_a,'.r','lineWidth',0.01);
%plot3(handles.axes_arm,[x1 x2],[y1 y2],[-z1 -z2],'b','lineWidth',1);

makeLink0(handles,handles.axes_arm, [0 0.4470 0.7410]);
handles.user.link1Patch = makeLink1(handles,handles.axes_arm, [0.4660 0.6740 0.1880]);
handles.user.link1Vertices = get(handles.user.link1Patch, 'Vertices')';
handles.user.link1Vertices(4,:) = ones(1, size(handles.user.link1Vertices,2));
handles.user.link2Patch = makeLink2(handles,handles.axes_arm, [0.4940 0.1840 0.5560]);
handles.user.link2Vertices = get(handles.user.link2Patch, 'Vertices')';
handles.user.link2Vertices(4,:) = ones(1, size(handles.user.link2Vertices,2));
handles.user.link3Patch = makeLink3(handles,handles.axes_arm, [0.6350 0.0780 0.1840]);
handles.user.link3Vertices = get(handles.user.link3Patch, 'Vertices')';
handles.user.link3Vertices(4,:) = ones(1, size(handles.user.link3Vertices,2));
handles.user.link4Patch = makeLink4(handles, handles.axes_arm, [0.9290 0.6940 0.1250]);
handles.user.link4Vertices = get(handles.user.link4Patch, 'Vertices')';
handles.user.link4Vertices(4,:) = ones(1, size(handles.user.link4Vertices,2));


link1verticesWRTground = R1 * handles.user.link1Vertices;
link2verticesWRTground = R1*R2*handles.user.link2Vertices;
link3verticesWRTground = R1*R2*R3 * handles.user.link3Vertices;
link4verticesWRTground = R1*R2*R3*R4 *handles.user.link4Vertices;

set(handles.user.link1Patch,'Vertices', link1verticesWRTground(1:3,:)');
set(handles.user.link2Patch,'Vertices', link2verticesWRTground(1:3,:)');
set(handles.user.link3Patch,'Vertices', link3verticesWRTground(1:3,:)');
set(handles.user.link4Patch,'Vertices', link4verticesWRTground(1:3,:)');

%% DISPLAY

xlabel(handles.axes_arm,'x');
ylabel(handles.axes_arm,'y');
zlabel(handles.axes_arm,'z');
xlim(handles.axes_arm,[-0.4 0.4]);
ylim(handles.axes_arm,[-0.4 0.4]);
zlim(handles.axes_arm,[-0 0.5]);

rotate3d(handles.axes_arm,'on')
view(handles.axes_arm,46,20);


pause(1/5000000);
end

