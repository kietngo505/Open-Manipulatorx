function Inverse_kinematic(handles)
%% Get params
d1=0.077;
a2=0.13;
a3=0.124;
a4=0.126;
alpha1 = pi/2;
phi=atan2(0.128,0.024);
theta1 = str2double(get(handles.edit_theta1,'String'))*pi/180;
theta2 = str2double(get(handles.edit_theta2,'String'))*pi/180;
theta3 = str2double(get(handles.edit_theta3,'String'))*pi/180;
theta4 = str2double(get(handles.edit_theta4,'String'))*pi/180;
x = str2double(get(handles.edit_x,'String'));
y = str2double(get(handles.edit_y,'String'));
z = str2double(get(handles.edit_z,'String'));
pitch = str2double(get(handles.edit_pitch,'String'))*pi/180;

%% Calculate
r = sqrt(x^2+y^2);
r3 = r-a4*cos(-pitch);
z3 = z-a4*sin(-pitch)-d1;
theta1_new = atan2(y,x);
theta3_new = acos(((a2^2+a3^2)-(z3^2+r3^2))/(2*a2*a3))+phi-pi;
if (cos(pi-phi+theta3_new)>1)|(cos(pi-phi+theta3_new)<-1)
        warndlg('Out of bound. Please type different input!' )
end
theta2_new = atan2(-(r3*(a2*sin(phi)+a3*sin(theta3_new))-z3*(a2*cos(phi)+a3*cos(theta3_new))),(r3*(a2*cos(phi)+a3*cos(theta3_new))+z3*(a2*sin(phi)+a3*sin(theta3_new))));
theta4_new = -pitch-theta2_new-theta3_new;

%% Motion
theta1_a = linspace(theta1,theta1_new,120);
theta2_a = linspace(theta2,theta2_new,120);
theta3_a = linspace(theta3,theta3_new,120);
theta4_a = linspace(theta4,theta4_new,120);
step=1;
for i=1:(120/step)
%theta1= theta1_a(i*step)
%theta2= theta2_a(i*step)
%theta3= theta3_a(i*step)
%theta4= theta4_a(i*step)
set(handles.edit_theta1,'String',num2str(theta1_a(i*step)*180/pi));
set(handles.edit_theta2,'String',num2str(theta2_a(i*step)*180/pi));
set(handles.edit_theta3,'String',num2str(theta3_a(i*step)*180/pi));
set(handles.edit_theta4,'String',num2str(theta4_a(i*step)*180/pi));
%% DH_Table
a     = [0      ; a2              ; a3              ; a4    ];
alpha = [alpha1      ; 0            ;0                ; 0     ];
d     = [d1      ; 0               ; 0               ; 0     ];
theta = [theta1_a(i*step) ; theta2_a(i*step) + phi ; theta3_a(i*step) - phi ; theta4_a(i*step)];

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

handles.display_x.String = sprintf('%.3f',p4(1));
handles.display_y.String = sprintf('%.3f',p4(2));
handles.display_z.String = sprintf('%.3f',p4(3));
handles.display_roll.String = sprintf('%.2f',o4(1)*180/pi);
handles.display_pitch.String = sprintf('%.2f',o4(2)*180/pi);
handles.display_yaw.String = sprintf('%.2f',o4(3)*180/pi);

%% PLOT COORDINATE AND LINK
R1=[ cos(theta1_a(i*step)), -sin(theta1_a(i*step)), 0,0;
    sin(theta1_a(i*step)), cos(theta1_a(i*step)), 0,0;
    0,          0,       1,0;
    0,0,0,1];
R2=[cos(-theta2_a(i*step)), 0, sin(-theta2_a(i*step)), 0;
    0, 1, 0, 0;
    -sin(-theta2_a(i*step)), 0, cos(-theta2_a(i*step)),0.077;
    0, 0, 0, 1];
R3=[cos(-theta3_a(i*step)), 0, sin(-theta3_a(i*step)), 0.024;
    0, 1, 0, 0;
    -sin(-theta3_a(i*step)), 0, cos(-theta3_a(i*step)),0.128;
    0, 0, 0, 1];
R4=[cos(-theta4_a(i*step)), 0, sin(-theta4_a(i*step)), 0.124;
    0, 1, 0, 0;
    -sin(-theta4_a(i*step)), 0, cos(-theta4_a(i*step)), 0;
    0, 0, 0, 1];
cla(handles.axes_arm,'reset');
hold(handles.axes_arm,'on');
grid(handles.axes_arm,'on');
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


pause(1/40000);
%set(handles.edit_theta1,'String',num2str(theta1_new*180/pi));
%set(handles.edit_theta2,'String',num2str(theta1_new*180/pi));
%set(handles.edit_theta3,'String',num2str(theta1_new*180/pi));
%set(handles.edit_theta4,'String',num2str(theta1_new*180/pi));
end
