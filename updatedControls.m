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


            while(startMoving == 0)
                brick.MoveMotor('BC', -50);


                % -------------------------------------------------------------------------
                % Distance and Maze Navigation
                % // FIXME: Algorithm has to be corrected
                % -------------------------------------------------------------------------

                % Kill switch to exit loop
                if (color(1) > 30 && color(2) < 20 && color(3) < 20)

                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    startMoving = 1;

                    % if blue
                elseif (color(1) < 10 && color(2) < 20 && color(3) > 18)
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    brick.playTone(1000,500,200);
                    pause(1);
                    startMoving = 1;

                    % if green
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
                    pause(.86);
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
                    pause(.88);
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
            % Manual controls will be used until key 'a' is pressed
            % // FIXME: Needs code still
            % -------------------------------------------------------------------------

            % Autonomous program will run until key 'm' is pressed
        case 'w'
            brick.MoveMotor('BC', -50);
            startMoving = 0;

        case 's'
            brick.MoveMotor('BC', 50);
            startMoving = 0;

        case 'a'
            brick.MoveMotor('B', -28);
            brick.MoveMotor('C', 25.2);
            startMoving = 0;

        case 'd'
            brick.MoveMotor('B', -28);
            brick.MoveMotor('C', 25.2);
            startMoving = 0;

        case 'x'
            brick.StopMotor('BC');
            startMoving = 0;


    end
end


CloseKeyboard();
