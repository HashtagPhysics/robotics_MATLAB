
for idx = 1:1000
    resetRobot
    trial(idx) = idx;
    dist_in(idx) = randbetween(1,200);
    M_in(idx) = randbetween(0.1,1);
    accel_in(idx) = randbetween(100,600);
   
    % Calculate distance travelled
    [robot, endTime(idx), error(idx)] = driveStraight(robot, dist_in(idx), M_in(idx), 0, accel_in(idx));
        

end