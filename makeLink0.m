function p = makeLink0(handles,parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
opacity = get(handles.slider_opacity,'Value');
link0Verts = [-0.04	-0.015	0;
    -0.04	0.015	0;
    0.015	0.015	0;
    0.015	-0.015	0;
    -0.04	-0.015	0.038;
    -0.04	0.015	0.038;
    0.015	0.015	0.038;
    0.015	-0.015	0.038];
link0Faces = [1 2 3 4;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    5 6 7 8];
p = patch('Parent', parentAxes, 'Faces',link0Faces,'Vertices',link0Verts,'FaceColor',faceColor,'FaceAlpha', opacity);

r = 0.015;
[X,Y,Z] = cylinder(r);
Z=Z*0.004+0.038;
surf('Parent', parentAxes,X,Y,Z,'FaceColor',faceColor,'FaceAlpha', opacity);
end