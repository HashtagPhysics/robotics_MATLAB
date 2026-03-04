function robot = updateField(robot)

    % Sample frame for video
    recorder('sample')

    % Calculate Position
    % robot.theta is in degrees, so we convert to radians
    angleRad = deg2rad(robot.theta); 
    rotM = [cos(angleRad), -sin(angleRad); sin(angleRad), cos(angleRad)];
    
    % Center of the patch (behind the robot)
    tX = robot.x - robot.targetDist * cos(angleRad);
    tY = robot.y - robot.targetDist * sin(angleRad);

    % Apply rotation and translation to the template
    newPoints = rotM * robot.targetTemplate + [tX; tY];
    
    % Update the Patch object
    robot.targetPatch.XData = newPoints(1,:);
    robot.targetPatch.YData = newPoints(2,:);
    
    % Update the plot with the robot's current state.
    robot.robotPatch.XData = robot.cornerPositions(1, :);
    robot.robotPatch.YData = robot.cornerPositions(2, :);
    robot.leftWheelPlot.XData = robot.leftWheelX;
    robot.leftWheelPlot.YData = robot.leftWheelY;
    robot.rightWheelPlot.XData = robot.rightWheelX;
    robot.rightWheelPlot.YData = robot.rightWheelY;
    drawnow;
end