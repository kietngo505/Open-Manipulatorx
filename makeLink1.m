function p = makeLink1(handles,parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
opacity = get(handles.slider_opacity,'Value');
link1Verts = [-0.016	-0.016	0.09,
    -0.016	-0.016	0.042,
    0.016	-0.016	0.042,
    0.016	-0.016	0.09,
    -0.016	0.016	0.09,
    -0.016	0.016	0.042,
    0.016	0.016	0.042,
    0.016	0.016	0.09];
link1Faces = [1 2 3 4;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    5 6 7 8];

p = patch('Parent', parentAxes, 'Faces',link1Faces,'Vertices',link1Verts,'FaceColor',faceColor,'FaceAlpha', opacity);


end