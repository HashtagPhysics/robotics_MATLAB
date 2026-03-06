
resetRobot



driftOffset = 0;

driveSpeed = 0.75;
turnSpeed = 0.75;
startTime = 0;

startPos = "center";

switch startPos
    case "center"
        robot.y = 158.32;
        [robot, endTime]= driveStraight(robot,70,driveSpeed,startTime);
        % Shoot Ball
               
    case "right"
        robot.y = 108.82;
        [robot, endTime]= driveStraight(robot,33,driveSpeed,startTime);
        [robot, endTime]= driveTurn(robot,-45 + driftOffset,turnSpeed,endTime);
        % Shoot Ball
        
    case "left"
        robot.y = 207.82;
        [robot, endTime]= driveStraight(robot,75,driveSpeed,startTime)
        [robot, endTime]= driveTurn(robot,63 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,70,driveSpeed,endTime)
        % Drop Coral
        [robot, endTime]= driveStraight(robot,-30,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-63 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,120,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,135 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,-75,driveSpeed,endTime)
        % Load New Coral
        [robot, endTime]= driveStraight(robot,28,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,45 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,60,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-53 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,55,turnSpeed,endTime)
        % Drop New Coral
        
end

%resetRobot

% Stop recorder
recorder('stop')