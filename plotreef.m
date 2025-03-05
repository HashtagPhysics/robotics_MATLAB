% Reef Parameters (inches)
reefCenterX = 176.745;
reefCenterY = 158.5;
reefSideLength = 37.82;
reefRotationDegrees = 30;
reefRotationRadians = deg2rad(reefRotationDegrees);

% Calculate Hexagon Vertices (Unrotated)
theta = (0:5) * 2 * pi / 6;
reefVerticesX = reefCenterX + reefSideLength * cos(theta);
reefVerticesY = reefCenterY + reefSideLength * sin(theta);

% Apply Rotation
rotationMatrixReef = [cos(reefRotationRadians), -sin(reefRotationRadians); sin(reefRotationRadians), cos(reefRotationRadians)];
reefVertices = [reefVerticesX - reefCenterX; reefVerticesY - reefCenterY];
rotatedReefVertices = rotationMatrixReef * reefVertices;
reefVerticesX = rotatedReefVertices(1, :) + reefCenterX;
reefVerticesY = rotatedReefVertices(2, :) + reefCenterY;

% Plot Reef (Rotated Hexagon)
reefPatch = patch(reefVerticesX, reefVerticesY, 'y');
reefPatch.EdgeColor = 'k';