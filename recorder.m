function recorder(command)
    % Manages video recording with start, sample, and stop commands.
    % Assumes fieldPlot is defined in the calling scope.
    %
    % Inputs:
    %   command: 'start', 'sample', or 'stop'.

    persistent videoObj;
    persistent isRecording;

    % Initialize isRecording if it's empty
    if isempty(isRecording)
        isRecording = false;
    end

    switch command
        case 'start'
            if ~isRecording
                videoObj = VideoWriter('robotrun.avi');
                videoObj.FrameRate = 10;
                open(videoObj);
                isRecording = true;
            else
                disp('Warning: Recorder already started.');
            end
        case 'sample'
            if isRecording
                % Use the hardcoded fieldPlot
                fieldPlot = gcf;
                frame = getframe(fieldPlot);
                writeVideo(videoObj, frame);
            end
        case 'stop'
            if isRecording
                close(videoObj);
                isRecording = false;
            end
        otherwise
            disp(['Warning: Invalid recorder command: ', command]);
    end
end