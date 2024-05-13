function p = makeLink2(handles, parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
opacity = get(handles.slider_opacity,'Value');
link2Verts = [-0.012	0.02	0.07-0.077
    -0.012	0.016	0.07-0.077
    0.012	0.02	0.07-0.077
    0.012	0.016	0.07-0.077
    -0.012	0.02	0.102-0.077
    -0.012	0.016	0.102-0.077
    0.012	0.02	0.102-0.077
    0.012	0.016	0.102-0.077
    -0.012	-0.02	0.07-0.077
    -0.012	-0.016	0.07-0.077
    0.012	-0.02	0.07-0.077
    0.012	-0.016	0.07-0.077
    -0.012	-0.02	0.102-0.077
    -0.012	-0.016	0.102-0.077
    0.012	-0.02	0.102-0.077
    0.012	-0.016	0.102-0.077
    0.012	0.02	0.106-0.077
    -0.012	0.02	0.106-0.077
    -0.012	-0.02	0.106-0.077
    0.012	-0.02	0.106-0.077
    -0.012	0.012	0.106-0.077
    -0.012	-0.012	0.106-0.077
    0.012	0.012	0.106-0.077
    0.012	-0.012	0.106-0.077
    -0.012	0.012	0.187-0.077
    -0.012	-0.012	0.187-0.077
    0.012	0.012	0.187-0.077
    0.012	-0.012	0.187-0.077
    0.04	0.016	0.187-0.077
    0.04	-0.016	0.187-0.077
    -0.012	0.016	0.223-0.077
    -0.012	-0.016	0.223-0.077
    0.04	0.016	0.223-0.077
    0.04	-0.016	0.223-0.077
    -0.012	0.016	0.187-0.077
    -0.012	-0.016	0.187-0.077];
link2Faces = [1 2 4 3;
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
    5 7 15 13;
    5 7 17 18;
    13 15 20 19;
    17 18 19 20;
    5 13 19 18;
    7 15 20 17;
    21 22 24 23;
    21 22 26 25;
    21 23 27 25;
    23 24 28 27;
    24 22 26 28;
    25 26 28 27;
    35 36 30 29;
    31 32 34 33;
    35 36 32 31;
    29 30 34 33;
    36 30 34 32;
    35 29 33 31];

p = patch('Parent', parentAxes, 'Faces',link2Faces,'Vertices',link2Verts,'FaceColor',faceColor,'FaceAlpha',opacity);
