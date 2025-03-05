% Initial Robot State
robot.x = 297.49 + robot.length/2;
robot.y = 158.5;
robot.theta = 180; % 180 degrees (facing left)

% Calculate initial wheel positions (inches)
robot.leftWheelX = robot.x - (robot.trackWidth / 2) * sin(deg2rad(robot.theta));
robot.leftWheelY = robot.y + (robot.trackWidth / 2) * cos(deg2rad(robot.theta));
robot.rightWheelX = robot.x + (robot.trackWidth / 2) * sin(deg2rad(robot.theta));
robot.rightWheelY = robot.y - (robot.trackWidth / 2) * cos(deg2rad(robot.theta));
robot.leftWheelCommand = 0;
robot.rightWheelCommand = 0;
robot.leftWheelVelocity = 0;
robot.rightWheelVelocity = 0;

% Calculate corner offsets (relative to robot center, inches)
robot.cornerOffsets = [
    -robot.length / 2, -robot.width / 2;
    robot.length / 2, -robot.width / 2;
    robot.length / 2, robot.width / 2;
    -robot.length / 2, robot.width / 2
]';

% Calculate rotated corner offsets
rotationMatrix = [cos(deg2rad(robot.theta)), -sin(deg2rad(robot.theta)); sin(deg2rad(robot.theta)), cos(deg2rad(robot.theta))];
rotatedOffsets = rotationMatrix * robot.cornerOffsets;

% Calculate corner positions
robot.cornerPositions = rotatedOffsets + [robot.x; robot.y];

% Reset sim time text
simTime = 0;
try 
    if ishghandle(fieldPlot)
        robot.simTimeText.String = sprintf('SimTime = %.3f seconds', simTime);
    end
end

% Update the field plot
try
    robot = updateField(robot);
end