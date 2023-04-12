global key

InitKeyboard();

% Instruction to connect ev3 to matlab within command windowsqqqqqqq
% brick = ConnectBrick('OLLIE');

% Set mode to RGB
brick.SetColorMode(2,4);

startMoving = 0;
rightTurns = 0;
leftTurns = 0;
counter = 0;

% Manual controls will be used in green and blue areas to pick up and
% drop off passenger model
% Full manual controls detailed below:
% Move forward: w
% Move backward: s
% Turn left: a
% Turn right: d
% Lift up: i
% Lift down: k


% -------------------------------------------------------------------------
% Vehicle will be moving autonomously until manualControls is true
% -------------------------------------------------------------------------

while 1
    pause(1);
    distance = brick.UltrasonicDist(4);
    touch = brick.TouchPressed(3);
    color =  brick.ColorRGB(2);
    disp(color);
    disp(touch);


    switch key

        % Up Arrow to start the autonomous mode
        case 'uparrow'
            touch = brick.TouchPressed(3);

            while(startMoving == 0)
                touch = brick.TouchPressed(3);
                color = brick.ColorRGB(2);
                brick.MoveMotor('B', -80);
                brick.MoveMotor('C', -83);
                distance = brick.UltrasonicDist(4);

                % kill switch
                if key == 'x'
                    brick.StopMotor('BC');
                    startMoving = 1;
                    % if red
                elseif (color(1) > 20 && color(2) < 20 && color(3) < 20)

                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);

                    % if blue
                elseif (color(1) < 10 && color(2) < 20 && color(3) > 10)
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    startMoving = 1;

                    % if green
                elseif (color(1) < 10 && color(2) > 10 && color(3) < 14)
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




                elseif touch == 1

                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.MoveMotor('B', 47.4);
                    brick.MoveMotor('C', 50);
                    pause(.75);
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.MoveMotor('B', -28);
                    brick.MoveMotor('C', 25.2);
                    pause(.7);
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(0.5);
                    distance = brick.UltrasonicDist(4);
                    touch = brick.TouchPressed(3);


                elseif distance > 40
                    pause(1);
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.MoveMotor('B', 30);
                    brick.MoveMotor('C', -25.2);
                    pause(.7);
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(0.5);
                    brick.MoveMotor('B', -47.4);
                    brick.MoveMotor('C', -50);
                    pause(2);
                end
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

            % Color Red


            % -------------------------------------------------------------------------
            % Other cases:
            % // Question: Are we going to include case m just in case?
            % -------------------------------------------------------------------------

            % Quit Program - Stop the Vehicle Completely
        case 'q'
            disp('Quit Program');
            brick.StopMotor('B');
            brick.StopMotor('C');
            break;

            % Restart the Program
        case 'r'
            disp('Restart');
            disp('Press up arrow');
            startMoving = 0;


            % -------------------------------------------------------------------------
            % MANUAL CONTROLS
            % Manual controls will be used until key 'x' is pressed
            % // FIXME: Needs code still
            % -------------------------------------------------------------------------

            % move forward
        case 'w'
            brick.MoveMotor('BC', -50);
            startMoving = 0;
            % move backward
        case 's'
            brick.MoveMotor('BC', 50);
            startMoving = 0;
            % turn left
        case 'a'
            brick.MoveMotor('B', -28);
            brick.MoveMotor('C', 25.2);
            startMoving = 0;
            % turn right
        case 'd'
            brick.MoveMotor('B', -28);
            brick.MoveMotor('C', 25.2);
            startMoving = 0;
            % lift up
        case 'i'
            brick.MoveMotor('A', 30);
            
            startMoving = 0;
            % lift down
        case 'k'
            brick.MoveMotor('A', -50);
            
            startMoving = 0;
            % exit autonomous mode
        case 'x'
            brick.StopMotor('ABC');
            startMoving = 0;


    end
end


CloseKeyboard();
