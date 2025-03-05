function robot = moveRobot(robot, dt)
    % Simulate robot movement based on instantaneous wheel ground speeds.

    % Calculate wheel displacements
    leftWheelDisplacement = robot.leftWheelSpeed * dt; % Ground speed * time
    rightWheelDisplacement = robot.rightWheelSpeed * dt; % Ground speed * time

    % Calculate change in robot position and orientation
    deltaTheta = (rightWheelDisplacement - leftWheelDisplacement) / robot.trackWidth;
    deltaX = (leftWheelDisplacement + rightWheelDisplacement) / 2 * cos(deg2rad(robot.theta) + deltaTheta / 2);
    deltaY = (leftWheelDisplacement + rightWheelDisplacement) / 2 * sin(deg2rad(robot.theta) + deltaTheta / 2);

    % Update robot state
    robot.x = robot.x + deltaX;
    robot.y = robot.y + deltaY;
    robot.theta = robot.theta + rad2deg(deltaTheta);

    % Recalculate wheel positions from center position
    robot.leftWheelX = robot.x - (robot.trackWidth / 2) * sin(deg2rad(robot.theta));
    robot.leftWheelY = robot.y + (robot.trackWidth / 2) * cos(deg2rad(robot.theta));
    robot.rightWheelX = robot.x + (robot.trackWidth / 2) * sin(deg2rad(robot.theta));
    robot.rightWheelY = robot.y - (robot.trackWidth / 2) * cos(deg2rad(robot.theta));

    % Calculate rotated corner offsets
    rotationMatrix = [cos(deg2rad(robot.theta)), -sin(deg2rad(robot.theta)); sin(deg2rad(robot.theta)), cos(deg2rad(robot.theta))];
    rotatedOffsets = rotationMatrix * robot.cornerOffsets;
    robot.cornerPositions = rotatedOffsets + [robot.x; robot.y];
end