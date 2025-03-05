function k = k_MotorSpeed()
    % Calculate motor speed conversion factor k.

    k = 150; % Constant value

    k_default = 150; % Default value in case of error

    if k == 0
        disp('Error: k_MotorSpeed() returned zero!');
        k = k_default;
    end
end