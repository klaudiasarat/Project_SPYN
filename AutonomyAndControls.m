% -------------------------------------------------------------------------
% As of 3/27/23, the vehicle would not work as expected
% Testing before implementing autonomous instructions/code:
% ------------------------------------------------------------------------- 


global key

InitKeyboard();
% brick = ConnectBrick('OLLIE');
    
% Set mode to RGB
    brick.SetColorMode(2,4); 

    startMoving = 0;
    rightTurns = 0;
    leftTurns = 0;
    counter = 0;

manualControls = false; % Not needed yet. Milestone 3
    % Manual controls will be used in green and blue areas to pick up and 
    % drop off passenger model
    % Full manual controls detailed below:
        % Move forward: uparrow
        % Move backward: downarrow
        % Turn left: leftarrow
        % Turn right: rightarrow

% -------------------------------------------------------------------------
% Vehicle will be moving autonomously until manualControls is true 
% -------------------------------------------------------------------------

while 1
    pause(1);
    distance = brick.UltrasonicDist(4);
    touch = brick.TouchPressed(3);
    touch1 = brick.TouchPressed(1);
    color =  brick.ColorRGB(2);
    disp(color);
    disp(touch);



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
% MANUAL CONTROLS
% Manual controls will be used until key 'a' is pressed
% ------------------------------------------------------------------------- 

            while(key == 'm') && (key ~= 'a')

    % Move Forward
                if(key == uparrow)
                    brick.MoveMotor('BC', 50);
                end
                
    % Move Backward
                if(key == downarrow)
                    brick.MoveMotor('BC', -50);
                end

% ------------------------------------------------------------------------- 
% COLOR DETECTION
    % Sensing the color red should result in a one second pause
    % Sensing the color blue should result in two beeps
    % Sensing the color green should result in three beeps

% RGB are stored in a row vector
    % color(1) = red values
    % color(2) = green values            
    % color(3) = blue values
% ------------------------------------------------------------------------- 
    
        case 'uparrow'
            while(startMoving == 0)
                touch = brick.TouchPressed(3);

                color = brick.ColorRGB(2);
                brick.MoveMotor('B', -50);
                brick.MoveMotor('C', -50);
                disp(color);

    % Kill switch to exit loop
                if touch == 1
                    brick.StopMotor('BC');
                    startMoving = 1;

    % Color Red
                elseif (color(1) > 30 && color(2) < 20 && color(3) < 20)
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    startMoving = 1;
    
    % Color Blue
               elseif (color(1) < 10 && color(2) < 20 && color(3) > 18)
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    startMoving = 1; 

    % Color Green           
                elseif (color(1) < 10 & color(2) > 14 && color(3) < 14)
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    startMoving = 1;
                end
            end

        case 'q'
            disp('Quit Program');
            brick.StopMotor('B');
            brick.StopMotor('C');
            break;

        case 'r'
            disp('Restart');
            disp('Press up arrow');
            startMoving = 0;
    end
end

CloseKeyboard();