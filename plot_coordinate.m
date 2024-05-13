function plot_coordinate(handles,x,y,z,x_dir,y_dir,z_dir,num,roll,pitch,yaw)
% x,y,z: toa do bat dau cua he toa do
% x_dir, y_dir, z_dir: huong cua truc toa do tuong ung
% num: so thu tu cua he truc toa do
% vidu: 
% plot_coordinate(p0(1),p0(2),p0(3),1,1,1,0);
R1=[ 1, 0, 0;
    0, cos(roll), -sin(roll);
    0, sin(roll)         ,       cos(roll)];
hold on
R2=[ cos(yaw), -sin(yaw), 0;
    sin(yaw), cos(yaw), 0;
    0,          0,       1];
hold on
R3=[cos(pitch), 0, sin(pitch);
    0, 1, 0;
    -sin(pitch), 0, cos(pitch)];
hold on

axis1=R2*R3*R1*[0.2*x_dir;       0;      0];
axis2=R2*R3*R1*[0;       0.2*y_dir;      0];
axis3=R2*R3*R1*[0;       0;      0.2*z_dir];

line(handles.axes_arm,[x x+axis1(1)],[y y+axis1(2)],[z z+axis1(3)],'linewidth',1.5,'color', 'red')
text(handles.axes_arm,x+axis1(1),y+axis1(2),z+axis1(3),(['x',num2str(num)]))

line(handles.axes_arm,[x x+axis2(1)],[y y+axis2(2)],[z z+axis2(3)],'linewidth',1.5,'color', 'green')
text(handles.axes_arm,x+axis2(1),y+axis2(2),z+axis2(3),(['y',num2str(num)]))

line(handles.axes_arm,[x x+axis3(1)],[y y+axis3(2)],[z z+axis3(3)],'linewidth',1.5,'color', 'blue')
text(handles.axes_arm,x+axis3(1),y+axis3(2),z+axis3(3),(['z',num2str(num)]))


% line(handles.axes1,[x x],[y y+0.2*y_dir],[z z],'linewidth',1.5,'color', 'green')
% text(handles.axes1,x,y+0.2*y_dir,z,(['y',num2str(num)]))
% 
% line(handles.axes1,[x x],[y y],[z z+0.2*z_dir],'linewidth',1.5,'color', 'blue')
% text(handles.axes1,x,y,z+0.2*z_dir,(['z',num2str(num)]))

end