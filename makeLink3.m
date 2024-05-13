function p = makeLink3(handles, parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
opacity = get(handles.slider_opacity,'Value');
link3Verts = [0.018-0.024 0.02 0.193-0.205
    0.018-0.024 0.016 0.193-0.205
    0.05-0.024 0.02 0.193-0.205
    0.05-0.024 0.016 0.193-0.205
    0.018-0.024 0.02 0.217-0.205
    0.018-0.024 0.016 0.217-0.205
    0.05-0.024 0.02 0.217-0.205
    0.05-0.024 0.016 0.217-0.205
    0.018-0.024 -0.02 0.193-0.205
    0.018-0.024 -0.016 0.193-0.205
    0.05-0.024 -0.02 0.193-0.205
    0.05-0.024 -0.016 0.193-0.205
    0.018-0.024 -0.02 0.217-0.205
    0.018-0.024 -0.016 0.217-0.205
    0.05-0.024 -0.02 0.217-0.205
    0.05-0.024 -0.016 0.217-0.205
    0.054-0.024 0.02 0.193-0.205
    0.054-0.024 -0.02 0.193-0.205
    0.054-0.024 0.02 0.217-0.205
    0.054-0.024 -0.02 0.217-0.205
    0.054-0.024 0.012 0.193-0.205
    0.054-0.024 -0.012 0.193-0.205
    0.115-0.024 0.012 0.193-0.205
    0.115-0.024 -0.012 0.193-0.205
    0.054-0.024 0.012 0.217-0.205
    0.054-0.024 -0.012 0.217-0.205
    0.115-0.024 0.012 0.217-0.205
    0.115-0.024 -0.012 0.217-0.205
    0.115-0.024 0.016 0.189-0.205
    0.115-0.024 -0.016 0.189-0.205
    0.163-0.024 0.016 0.189-0.205
    0.163-0.024 -0.016 0.189-0.205
    0.115-0.024 0.016 0.221-0.205
    0.115-0.024 -0.016 0.221-0.205
    0.163-0.024 0.016 0.221-0.205
    0.163-0.024 -0.016 0.221-0.205];
link3Faces = [1 2 4 3;
    1 2 6 5;
    1 3 7 5;
    3 4 8 7;
    4 2 6 8;
    5 6 8 7;
    9 10 12 11;
    9 10 14 13;
    10 12 16 14;
    11 12 16 15;
    11 9 13 15;
    13 14 16 15;
    3 7 19 17;
    11 15 20 18;
    3 7 15 11;
    17 18 20 19;
    3 11 18 17;
    7 15 20 19;
    21 22 24 23;
    21 22 26 25;
    21 23 27 25;
    23 24 28 27;
    24 22 26 28;
    25 26 28 27;
    29 30 32 31;
    29 30 34 33;
    30 32 36 34;
    31 32 36 35;
    31 29 33 35;
    33 34 36 35];

p = patch('Parent', parentAxes, 'Faces',link3Faces,'Vertices',link3Verts,'FaceColor',faceColor,'FaceAlpha',opacity);

end


