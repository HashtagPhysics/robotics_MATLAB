function robot = updateField(robot)

    % Sample frame for video
    recorder('sample')

    % Update the plot with the robot's current state.
    robot.robotPatch.XData = robot.cornerPositions(1, :);
    robot.robotPatch.YData = robot.cornerPositions(2, :);
    robot.leftWheelPlot.XData = robot.leftWheelX;
    robot.leftWheelPlot.YData = robot.leftWheelY;
    robot.rightWheelPlot.XData = robot.rightWheelX;
    robot.rightWheelPlot.YData = robot.rightWheelY;
    drawnow;
end