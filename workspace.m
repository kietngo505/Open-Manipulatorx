function workspace(handles)
%WORKSPACE Summary of this function goes here
%   Detailed explanation goes here
if handles.checkbox_workspace.Value==1
    r = 0.456-0.077;
    [u,v] = meshgrid(linspace (0,2*pi, 50), linspace (0, pi , 50));
    x = r.*cos(u).*sin(v);
    y = r.*sin(u).*sin(v);
    z = r.*cos(v)+0.077;
    surf (handles.axes_arm, x, y, z, 'EdgeColor', 'none', 'FaceColor', 'blue', 'Facealpha',0.2);
    axis equal % truc vuong
    camlight % do bong
    lighting gouraud %anh sang dong deu tren mat
end
end

