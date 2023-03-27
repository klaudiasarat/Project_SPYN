% Not using right now - may modify or come back to this later 
%        startMoving = 0;
 %       rightTurns = 0;
  %      leftTurns = 0;
   %     counter = 0;


% ------------------------------------------------------------------------------------------------
global key

InitKeyboard();

manualControls = false;
    % Manual controls will be used in green and blue areas to pick up and drop off passenger model
    % Full manual controls detailed below:
        % Move forward: uparrow
        % Move backward: downarrow
        % Turn left: 




while 1
    pause(0.1);
    distance = brick.UltrasonicDist(4);
    touch = brick.TouchPressed(3);
    touch1 = brick.TouchPressed(1);
    color = brick.ColorCode(2);


    switch key

        case 'uparrow'
            while(startMoving == 0)
                
                if(touch1 == 1)
                    startMoving = 1;
                end
                pause(1);

                if(key == 'q')
                    disp('Quit Program');
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                end
            
                if (key == 'r')
                    disp('Restart');
                    disp('Press up arrow');
                    startMoving = 0;
                end

% ------------------------------------------------------------------------------------------------
% As of 3/27/23, the vehicle would not work as expected
% Testing before implementing autonomous instructions/code:

% ------------------------------------------------------------------------------------------------
% MANUAL CONTROLS
    % Move Forward
                if (key == uparrow)
                    brick.MoveMotor('BC', 50);
                end
                
    % Move Backward
                if (key == downarrow)
                    brick.MoveMotor('BC', -50);
                end

    % Turn Left
                if (key == leftarrow)
                    brick.MoveMotor('B', 45);
                    brick.MoveMotor('C');
                end
                    
    % Turn Right
                if (key == reightarrow)
                    brick.MoveMotor('B');
                    brick.MoveMotor('C', 45);
                end
            
% ------------------------------------------------------------------------------------------------        
% COLOR DETECTION
    % Sensing the color red should result in a one second pause
    % Sensing the color blue should result in two beeps
    % Sensing the color green should result in three beeps

                brick.SetColorMode(2);

    % Color Red
                if (color == 1)
                    pause(1.0);
                end
    
    % Color Blue
                elseif (color == 2)
                    brick.beep();
                    pause(0.1);
                    brick.beep();
                    pause(0.1);
                end    

    % Color Green           
                elseif (color == 3)
                    brick.beep();
                    pause(0.1);
                    brick.beep();
                    pause(0.1);
                    brick.beep();
                    pause(0.1);
                end
    end
end
CloseKeyboard();