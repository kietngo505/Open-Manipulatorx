function p = makeLink4(handles, parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
opacity = get(handles.slider_opacity,'Value');
link4Verts = [0.018-0.024 0.02 0.193-0.205
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
    0.056-0.024 0.02 0.193-0.205
    0.056-0.024 -0.02 0.193-0.205
    0.056-0.024 0.02 0.24-0.205
    0.056-0.024 -0.02 0.24-0.205
    0.05-0.024 0.02 0.24-0.205
    0.05-0.024 -0.02 0.24-0.205
    0.054-0.024 0.012 0.193-0.205
    0.054-0.024 -0.012 0.193-0.205
    0.065-0.024 0.012 0.193-0.205
    0.065-0.024 -0.012 0.193-0.205
    0.054-0.024 0.012 0.24-0.205
    0.054-0.024 -0.012 0.24-0.205
    0.065-0.024 0.012 0.24-0.205
    0.065-0.024 -0.012 0.24-0.205
    0.065-0.024 0.02 0.189-0.205
    0.065-0.024 -0.02 0.189-0.205
    0.078-0.024 0.02 0.189-0.205
    0.078-0.024 -0.02 0.189-0.205
    0.065-0.024 0.02 0.244-0.205
    0.065-0.024 -0.02 0.244-0.205
    0.078-0.024 0.02 0.244-0.205
    0.078-0.024 -0.02 0.244-0.205
    0.078-0.024 0.02 0.189-0.205
    0.078-0.024 -0.02 0.189-0.205
    0.085-0.024 0.055 0.189-0.205
    0.085-0.024 -0.055 0.189-0.205
    0.078-0.024 0.02 0.22-0.205
    0.078-0.024 -0.02 0.22-0.205
    0.085-0.024 0.055 0.22-0.205
    0.085-0.024 -0.055 0.22-0.205
    0.085-0.024 0.038 0.189-0.205
    0.085-0.024 0.024 0.189-0.205
    0.168-0.024 0.034 0.195-0.205
    0.168-0.024 0.028 0.195-0.205
    0.085-0.024 0.038 0.22-0.205
    0.085-0.024 0.024 0.22-0.205
    0.168-0.024 0.034 0.215-0.205
    0.168-0.024 0.028 0.215-0.205
    0.085-0.024 -0.038 0.189-0.205
    0.085-0.024 -0.024 0.189-0.205
    0.168-0.024 -0.034 0.195-0.205
    0.168-0.024 -0.028 0.195-0.205
    0.085-0.024 -0.038 0.22-0.205
    0.085-0.024 -0.024 0.22-0.205
    0.168-0.024 -0.034 0.215-0.205
    0.168-0.024 -0.028 0.215-0.205];
link4Faces = [1 2 4 3;
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
    3 21 19 17;
    11 22 20 18;
    3 21 22 11;
    17 18 20 19;
    3 11 18 17;
    21 22 20 19;
    23 24 26 25;
    23 24 28 27;
    23 25 29 27;
    25 26 30 29;
    26 24 28 30;
    27 28 30 29;
    31 32 34 33;
    31 32 36 35;
    32 34 38 36;
    33 34 38 37;
    33 31 35 37;
    35 36 38 37;
    39 40 42 41;
    39 40 44 43;
    40 42 46 44;
    41 42 46 45;
    41 39 43 45;
    43 44 46 45;
    47 48 50 49;
    47 48 52 51;
    48 50 54 52;
    49 50 54 53;
    49 47 51 53;
    51 52 54 53;
    55 56 58 57;
    55 56 60 59;
    56 58 62 60;
    57 58 62 61;
    57 55 59 61;
    59 60 62 61];
p = patch('Parent', parentAxes, 'Faces',link4Faces,'Vertices',link4Verts,'FaceColor',faceColor,'FaceAlpha',opacity);

end

