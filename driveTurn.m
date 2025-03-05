function [robot, endTime] = driveTurn(robot, angle_deg, motorSpeed_M, startTime)
    % Drive straight for a number of inches.
    % To go backwards, enter a negative distance.

    looptime = getPeriod();
    
    % Set robot track width in inches
    trackwidth = robot.trackWidth;
    
    accel_in_s2 = 200; % Acceleration/deceleration rate (inches/s²)

    % Negative motor speed is not supported
    if motorSpeed_M <= 0
        disp('Error: Motor speed is negative in driveStraight');
        return;
    end

    % Convert negative distance to direction
    rightturn = true;
    if angle_deg < 0
        rightturn = false;
        angle_deg = abs(angle_deg);
    end

    arclength_in = (trackwidth * pi * angle_deg) / 360.0;
    
    % Convert motor speed command to inches per second
    v_command_ips = k_MotorSpeed() * motorSpeed_M;

    % Convert acceleration rate to motor step per loop
    M_step = (accel_in_s2 * looptime) / k_MotorSpeed();

    % Maximum velocity that can be achieved in the distance given
    v_max_ips = sqrt(accel_in_s2 * arclength_in);
    v_arb_command_ips = min(v_command_ips, v_max_ips);
    arb_MotorSpeed_M = v_arb_command_ips / k_MotorSpeed();

    if v_arb_command_ips <= 0
        disp('Error: Arbitrated motor speed is zero in driveStraight');
        return;
    end

    % Calculate ramp time
    t_accel_s = v_arb_command_ips / accel_in_s2;

    % Calculate total time
    t_total_s = arclength_in / v_arb_command_ips + v_arb_command_ips / accel_in_s2;

    % Initialize drive timer
    driveTime = 0;

    motorCommand = 0;
        
    while driveTime < t_total_s
        % Every loop in while driving straight
        driveTime = driveTime + looptime;
        simTime = startTime + driveTime;

        if driveTime < t_accel_s
            % Ramp up speed
            motorCommand = motorCommand + M_step;
        elseif driveTime >= (t_total_s - t_accel_s)
            % Ramp down speed
            motorCommand = motorCommand - M_step;
        else
            % constant velocity
            motorCommand = arb_MotorSpeed_M;
        end

        % Set the motor speed
        if rightturn
            % turn right
            robot = setLeftSpeed(robot, motorCommand);
            robot = setRightSpeed(robot, -motorCommand);
        else
            % turn left
            robot = setLeftSpeed(robot, -motorCommand);
            robot = setRightSpeed(robot, motorCommand);
        end

        % Simulate robot movement
        robot = moveRobot(robot, looptime);

        % Update plot
        updateField(robot);
        
        % Update simulation time text
        robot.simTimeText.String = sprintf('SimTime = %.3f seconds', simTime);
        
        pause(looptime); % Simulate loop time
    end

    robot = setLeftSpeed(robot, 0);
    robot = setRightSpeed(robot, 0);

    % Update plot one last time.
    robot = updateField(robot);

    %Update time one last time.
    robot.simTimeText.String = sprintf('SimTime = %.3f seconds', simTime);
    endTime = startTime + driveTime;
end





