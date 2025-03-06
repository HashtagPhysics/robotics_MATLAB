% Field Dimensions (inches)
fieldLength = 345.44; % barge centerline to edge
fieldWidth = 317.15;
fieldLine = 298.5;

% Processor location
processorCenter = 235.73;
processorWidth = 28;
processorEdgesX = [processorCenter - processorWidth/2, processorCenter + processorWidth/2];

% Algae placement
% unknown spec, measured from diagram
algaeX = [47.41 47.41 47.41];
algaeY = [fieldWidth*0.27 fieldWidth*0.5 fieldWidth*0.73]; 
algaeD = [16.25 16.25 16.25];
algaeColor = [0.631 0.910 0.894];

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

    % Draw the coral stations
    line([0, 67.95], [49.37, 0], 'Color', 'b', 'LineWidth', 2); %SW coral station
    line([0, 67.95], [267.63, 317], 'Color', 'b', 'LineWidth', 2); %SW coral station
    
    % Draw the starting line    
    line([fieldLine, fieldLine], [0, fieldWidth], 'Color', 'k', 'LineWidth', 2);
    
    % plot the reef
    plotreef

    % Draw lines to show processor location
    proc_len = 4;
    line([processorEdgesX(1) processorEdgesX(1)], [0, 0 + proc_len], 'Color', 'b', 'LineWidth', 2);
    line([processorEdgesX(2) processorEdgesX(2)], [0, 0 + proc_len], 'Color', 'b', 'LineWidth', 2);
    
    
    % Draw the algae
    drawCircle(algaeX, algaeY, algaeD, algaeColor)
    
    % Create robot patch and store handle
    robot.robotPatch = patch(robot.cornerPositions(1, :), robot.cornerPositions(2, :), 'c');
    robot.robotPatch.EdgeColor = 'b';
    robot.robotPatch.LineWidth = 2;
    robot.robotPatch.EdgeColor(3) = 0; % set the back edge to black.

    % Create wheel plots and store handles
    robot.leftWheelPlot = plot(robot.leftWheelX, robot.leftWheelY, 'm.', 'MarkerSize', 30); % Magenta left wheel
    robot.rightWheelPlot = plot(robot.rightWheelX, robot.rightWheelY, 'r.', 'MarkerSize', 30); % Red right wheel


    % Add Simulation time
    robot.simTimeText = text(80, 20, 'SimTime = 0.000 seconds', 'FontSize', 12);

    axis equal;
    xlim([0, fieldLength]);
    ylim([0, fieldWidth]);
    xlabel('X (inches)');
    ylabel('Y (inches)');
    title('REEFSCAPE 2025 - Robot Position');
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