function robot = setLeftSpeed(robot, command)
    robot.leftWheelCommand = command;
    robot.leftWheelSpeed = k_MotorSpeed * command;
    return;
end