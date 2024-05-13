function T = Forward_kinematic(handles)
%FORWARD_KINEMATIC Cong thuc tinh ma tran bien doi thuan nhat T
%% DH_Table

% a     = [0      ; 0.13            ;  0.124            ; 0.126 ];
% alpha = [0      ; 0               ;  0                ; pi/2  ];
% d     = [0.077  ; 0               ;  0                ; 0     ]; 
% theta = [theta1 ; theta2 + 1.3854 ;  theta 3 - 1.3854 ; theta4];
%% Update_Data
% Get parameters from GUI
a2     = 0.13;
a3     = 0.124;
a4     = 0.126;
d1     = 0.077;
alpha1 = pi/2;
phi=atan2(0.128,0.024);
theta1 = str2double(get(handles.edit_theta1,'String'))*pi/180;
theta2 = str2double(get(handles.edit_theta2,'String'))*pi/180;
theta3 = str2double(get(handles.edit_theta3,'String'))*pi/180;
theta4 = str2double(get(handles.edit_theta4,'String'))*pi/180;

%% DH_Table
a     = [0      ; a2              ; a3              ; a4    ];
alpha = [alpha1      ; 0            ;0                ; 0     ];
d     = [d1      ; 0               ; 0               ; 0     ];
theta = [theta1 ; theta2 + phi ; theta3 - phi ; theta4];

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

%% PLOT COORDINATE AND LINK
R1=[ cos(theta1), -sin(theta1), 0,0;
    sin(theta1), cos(theta1), 0,0;
    0,          0,       1,0;
    0,0,0,1];
R2=[cos(-theta2), 0, sin(-theta2), 0;
    0, 1, 0, 0;
    -sin(-theta2), 0, cos(-theta2),0.077;
    0, 0, 0, 1];
R3=[cos(-theta3), 0, sin(-theta3), 0.024;
    0, 1, 0, 0;
    -sin(-theta3), 0, cos(-theta3),0.128;
    0, 0, 0, 1];
R4=[cos(-theta4), 0, sin(-theta4), 0.124;
    0, 1, 0, 0;
    -sin(-theta4), 0, cos(-theta4), 0;
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
workspace(handles);

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
handles.display_x.String = sprintf('%.3f',p4(1));
handles.display_y.String = sprintf('%.3f',p4(2));
handles.display_z.String = sprintf('%.3f',p4(3));
handles.display_roll.String = sprintf('%.2f',o4(1)*180/pi);
handles.display_pitch.String = sprintf('%.2f',o4(2)*180/pi);
handles.display_yaw.String = sprintf('%.2f',o4(3)*180/pi);

xlabel(handles.axes_arm,'x');
ylabel(handles.axes_arm,'y');
zlabel(handles.axes_arm,'z');
xlim(handles.axes_arm,[-0.4 0.4]);
ylim(handles.axes_arm,[-0.4 0.4]);
zlim(handles.axes_arm,[-0 0.5]);

rotate3d(handles.axes_arm,'on')
view(handles.axes_arm,46,20);

end

