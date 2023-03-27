% Not using right now - may modify or come back to this later 
%        startMoving = 0;
 %       rightTurns = 0;
  %      leftTurns = 0;
   %     counter = 0;


% -------------------------------------------------------------------------
global key

InitKeyboard();

manualControls = false;
    % Manual controls will be used in green and blue areas to pick up and 
    % drop off passenger model
    % Full manual controls detailed below:
        % Move forward: uparrow
        % Move backward: downarrow
        % Turn left: leftarrow
        % Turn right: rightarrow


% -------------------------------------------------------------------------
% Vehicle will be moving autonomously until manualControls is true 
    %

while 1
    pause(0.1);
    distance = brick.UltrasonicDist(4);
    touch = brick.TouchPressed(3);
    touch1 = brick.TouchPressed(1);
    color = brick.ColorCode(2);


    switch key

    % Initial Up Arrow press will start the program
        case 'uparrow'
            disp('Autonomous mode: Starting Program')
            setMotorSpeed('BC', 60);  % Vehicle will drive forward
            
    % Autonomous program will run until key 'm' is pressed        
            while(key == 'a') && (key ~= 'm')
                
    % Quit Program - Stop the Vehicle Completely
                if(key == 'q')
                    disp('Quit Program');
                    brick.StopMotor('BC');
                end
            
    % Restart the Program
                if(key == 'r')
                    brick.StopMotor('BC');
                    disp('Restart');
                    disp('Press up arrow');
                end

% -------------------------------------------------------------------------
% TOUCH SENSOR




% ------------------------------------------------------------------------- 
% COLOR DETECTION
    % Sensing the color red should result in a one second pause
    % Sensing the color blue should result in two beeps
    % Sensing the color green should result in three beeps

                brick.SetColorMode(2);

    % Color Red
                if(color == 1)
                    pause(1.0);
                end
    
    % Color Blue
                if(color == 2)
                    brick.beep();
                    pause(0.05);
                    brick.beep();
                    pause(0.05);

                    % Enter manual controls mode for passenger pickup
                    key == 'm';  
                end    

    % Color Green           
                if(color == 3)
                    brick.beep();
                    pause(0.05);
                    brick.beep();
                    pause(0.05);
                    brick.beep();
                    pause(0.05);

                    % Enter manual controls mode for passenger dropoff
                    key == 'm';
                end

% -------------------------------------------------------------------------
% As of 3/27/23, the vehicle would not work as expected
% Testing before implementing autonomous instructions/code:

% -------------------------------------------------------------------------
% MANUAL CONTROLS
% Manual controls will be used until key 'a' is pressed        
            while(key == 'm') && (key ~= 'a')

    % Move Forward
                if(key == uparrow)
                    brick.MoveMotor('BC', 50);
                end
                
    % Move Backward
                if(key == downarrow)
                    brick.MoveMotor('BC', -50);
                end

    % Turn Left
                if(key == leftarrow)
                    brick.MoveMotor('B', 45);
                    brick.MoveMotor('C');
                end
                    
    % Turn Right
                if(key == rightarrow)
                    brick.MoveMotor('B');
                    brick.MoveMotor('C', 45);
                end
            

                
            end

    end
end

CloseKeyboard();
