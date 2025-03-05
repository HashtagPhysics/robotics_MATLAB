function robot = setRightSpeed(robot, command)
    robot.rightWheelCommand = command;
    robot.rightWheelSpeed = k_MotorSpeed * command;
    return;
end