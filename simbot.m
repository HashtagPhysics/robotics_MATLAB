% Field Dimensions (inches)
fieldLength = 345.44;
fieldWidth = 317.15;

% Robot Parameters (inches)
robot.wheelDiameter = 4;
robot.trackWidth = 24;
robot.length = 32;
robot.width = 28;

% Initialize the robot position and state
resetRobot

% Initialize Plot
try
    plot_open = ishghandle(fieldPlot);
catch
    plot_open = false;
end

if ~plot_open

    fieldPlot = figure;
    hold on;
    rectangle('Position', [0, 0, fieldLength, fieldWidth], 'EdgeColor', 'k', 'LineWidth', 2);

    % plot the reef
    plotreef

    % Create robot patch and store handle
    robot.robotPatch = patch(robot.cornerPositions(1, :), robot.cornerPositions(2, :), 'c');
    robot.robotPatch.EdgeColor = 'b';
    robot.robotPatch.LineWidth = 2;
    robot.robotPatch.EdgeColor(3) = 0; % set the back edge to black.

    % Create wheel plots and store handles
    robot.leftWheelPlot = plot(robot.leftWheelX, robot.leftWheelY, 'm.', 'MarkerSize', 30); % Magenta left wheel
    robot.rightWheelPlot = plot(robot.rightWheelX, robot.rightWheelY, 'r.', 'MarkerSize', 30); % Red right wheel

    % Add legend
%     legend([robot.leftWheelPlot, robot.rightWheelPlot], 'Left Wheel', 'Right Wheel', 'Location', 'northwest');

    % Add Simulation time
    robot.simTimeText = text(10, 20, 'SimTime = 0.000 seconds', 'FontSize', 12);

    axis equal;
    xlim([0, fieldLength]);
    ylim([0, fieldWidth]);
    xlabel('X (inches)');
    ylabel('Y (inches)');
    title('REEFSCAPE 2025 - Robot Position');
    grid on;
    hold off;
end