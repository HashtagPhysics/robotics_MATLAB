% Field Dimensions (inches)
fieldLength = 325.06; % barge centerline to edge
fieldWidth = 316.64;
fieldLine = 156.06;

% **** Plot No Go Areas ****

% Processor location
processorCenter = 235.73;
processorWidth = 28;
processorEdgesX = [processorCenter - processorWidth/2, processorCenter + processorWidth/2];

% % Algae placement
% % unknown spec, measured from diagram
% algaeX = [47.41 47.41 47.41];
% algaeY = [fieldWidth*0.27 fieldWidth*0.5 fieldWidth*0.73]; 
% algaeD = [16.25 16.25 16.25];
% algaeColor = [0.631 0.910 0.894];

% Robot Parameters (inches)
% square chassis
bumper = 3.5;
robot.wheelDiameter = 4;
robot.trackWidth = 21.5;
robot.length = 26.3 + 2*bumper;
robot.width = 26.5 + 2*bumper;

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
    

    % Draw the starting line    
    line([fieldLine, fieldLine], [0, fieldWidth], 'Color', 'k', 'LineWidth', 2);

    % Hub Area
    rectangle('Position', [159.36,49.86, 44.4, 216.92], 'Curvature', [0, 0], 'EdgeColor', 'k', 'FaceColor', [0.3 0.3 0.3]);
    
    % Bumps
    rectangle('Position', [159.36,61.86, 44.4, 73], 'Curvature', [0, 0], 'EdgeColor', 'k', 'FaceColor', [0.8 0.8 0.8]);
    line([181.56, 181.56], [61.86, 134.86], 'Color', 'k', 'LineWidth', 1); 
    rectangle('Position', [159.36,181.78, 44.4, 73], 'Curvature', [0, 0], 'EdgeColor', 'k', 'FaceColor', [0.8 0.8 0.8]);
    line([181.56, 181.56], [181.78, 254.78], 'Color', 'k', 'LineWidth', 1); 
    
    % Tower
    rectangle('Position', [0,129.235, 43.51, 35.25], 'Curvature', [0, 0], 'EdgeColor', 'k', 'FaceColor', [0.5 0.5 0.5]);
    line([41.755, 41.755], [123.36, 170.36], 'Color', 'b', 'LineWidth', 2); 

    % Depot
    rectangle('Position', [0,213.32, 27, 42], 'Curvature', [0, 0], 'EdgeColor', 'k', 'FaceColor', [0.8 0.8 0.8]);

    % Outpost
    line([0, 5], [9.62, 9.62], 'Color', 'b', 'LineWidth', 2);
    line([0, 5], [41.62, 41.62], 'Color', 'b', 'LineWidth', 2);
    
    % plot the hub
    plothub
    
%     % Draw the algae
%     drawCircle(algaeX, algaeY, algaeD, algaeColor)
    
    % Create robot patch and store handle
    robot.robotPatch = patch(robot.cornerPositions(1, :), robot.cornerPositions(2, :), 'c');
    robot.robotPatch.EdgeColor = 'b';
    robot.robotPatch.LineWidth = 2;
    robot.robotPatch.EdgeColor(3) = 0; % set the back edge to black.

    % Create wheel plots and store handles
    robot.leftWheelPlot = plot(robot.leftWheelX, robot.leftWheelY, 'm.', 'MarkerSize', 30); % Magenta left wheel
    robot.rightWheelPlot = plot(robot.rightWheelX, robot.rightWheelY, 'r.', 'MarkerSize', 30); % Red right wheel

    

    % Add Simulation time
    robot.simTimeText = text(162, 10, 'SimTime = 0.000 s', 'FontSize', 12);

    axis equal;
    xlim([0, fieldLength]);
    ylim([0, fieldWidth]);
    xlabel('X (inches)');
    ylabel('Y (inches)');
    title('REBUILT 2026 - Robot Position');
    grid on;
    hold off;
end

% Circle drawing function
function drawCircle(x, y, D, fillColor)
    % Draws multiple filled circles with black outlines.
    %
    % Inputs:
    %   x: Array of x-coordinates of the circle centers.
    %   y: Array of y-coordinates of the circle centers.
    %   D: Array of diameters of the circles.
    %   fillColor: Fill color of the circles (e.g., 'r', 'g', [0.5 0.2 0.8], '#FF8000').
    %              Can be a single color or an array of colors.

    if length(x) ~= length(y) || length(x) ~= length(D)
        error('x, y, and D arrays must have the same length.');
    end

    for i = 1:length(x)
        pos = [x(i) - D(i)/2, y(i) - D(i)/2, D(i), D(i)];

        if iscell(fillColor) && length(fillColor) == length(x)
            currentFillColor = fillColor{i};
        else
            currentFillColor = fillColor;
        end

        rectangle('Position', pos, 'Curvature', [1, 1], 'EdgeColor', 'k', 'FaceColor', currentFillColor);
    end
end