
resetRobot

% Change to decrease erorr when turning
driftOffset = -2.25;

driveSpeed = 1;
turnSpeed = 0.75;
startTime = 0;
startPos = "center_L";

switch startPos
    case "center_R"
        robot.y = 158.5;
        [robot, endTime]= driveStraight(robot,88,driveSpeed,startTime)
        % Drop coral
        [robot, endTime]= driveStraight(robot,-12,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,90 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,60,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-90 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,120,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-138 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,-98,driveSpeed,endTime)
        % Load New Coral
        [robot, endTime]= driveStraight(robot,98,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-40 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,30,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,60 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,16,driveSpeed,endTime)
        % Drop New Coral
        
    case "center_L"
        robot.y = 158.5;
        [robot, endTime]= driveStraight(robot,88,driveSpeed,startTime)
        % Drop coral
        [robot, endTime]= driveStraight(robot,-12,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-90 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,60,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,90 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,120,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,138 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,-98,driveSpeed,endTime)
        % Load New Coral
        [robot, endTime]= driveStraight(robot,85,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,40 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,45,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-35 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,5,driveSpeed,endTime)
        % Drop New Coral
        
    case "right"
        robot.y = 257.75;
        [robot, endTime]= driveStraight(robot,75,driveSpeed,startTime)
        [robot, endTime]= driveTurn(robot,-60 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,70,driveSpeed,endTime)
        % Drop Coral
        [robot, endTime]= driveStraight(robot,-70,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,60 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,222,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-135 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,-10,driveSpeed,endTime)
        % Load New Coral
        [robot, endTime]= driveStraight(robot,28,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-45 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,120,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,58 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,25,turnSpeed,endTime)
        % Drop New Coral
        
    case "left"
        robot.y = 59.25;
        [robot, endTime]= driveStraight(robot,75,driveSpeed,startTime)
        [robot, endTime]= driveTurn(robot,60 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,70,driveSpeed,endTime)
        % Drop Coral
        [robot, endTime]= driveStraight(robot,-70,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-60 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,222,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,135 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,-10,driveSpeed,endTime)
        % Load New Coral
        [robot, endTime]= driveStraight(robot,5,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,45 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,125,driveSpeed,endTime)
        [robot, endTime]= driveTurn(robot,-40 + driftOffset,turnSpeed,endTime)
        [robot, endTime]= driveStraight(robot,25,turnSpeed,endTime)
        % Drop New Coral
        
end