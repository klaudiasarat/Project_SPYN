global key
InitKeyboard();
% brick = ConnectBrick('OLLIE');
% C motor is left
% B motor is right
% A motor is lift

% Sensors:
% 1 = touch
% 2 = color
% 3 = touch
% 4 = distance
startMoving = 0;


while 1
    pause(0.1);
    color =  brick.ColorRGB(2);
    disp(color);



    switch key

        case 'uparrow'
            while(startMoving == 0)
                pause(.03);
                brick.MoveMotor('BC', -80);
                brick.MoveMotor('B', -80);
                brick.MoveMotor('C', -83);

                touch = brick.TouchPressed(3);
                touch1 = brick.TouchPressed(1);
                color = brick.ColorRGB(2);
                distance = brick.UltrasonicDist(4);

                % kill switch
                if key == 'x'
                    brick.StopMotor('BC');
                    startMoving = 1;
                    % if red
                elseif (color(1) > 6 && color(2) < 3 && color(3) < 3)

                    brick.StopMotor('BC');
                    pause(1);

                    % if blue
                elseif (color(1) < 2 && color(2) < 5 && color(3) > 6)
                    brick.StopMotor('BC');
                    startMoving = 1;

                    % if green
                elseif (color(1) < 3 && color(2) > 3 && color(3) < 4)
                    brick.StopMotor('BC');
                    startMoving = 1;

                elseif (or(touch == 1, touch1 == 1))
                    % stop moving
                    brick.StopMotor('BC');
                    pause(.3);

                    % reverse to get away from wall
                    brick.MoveMotor('B', 80);
                    brick.MoveMotor('C', 81.2);
                    pause(.35);

                    % stop before turning left
                    brick.StopMotor('BC');
                    pause(.2);

                    % turn left
                    brick.MoveMotor('B', -75);
                    brick.MoveMotor('C', 75);
                    pause(.21);

                    % stop turning left
                    brick.StopMotor('BC');
                    pause(0.3);

                    brick.MoveMotor('B', -80);
                    brick.MoveMotor('C', -82);
                    pause(.7);


                elseif distance > 40

                    % pause to not turn right away
                    pause(.4);

                    % stop before turning
                    brick.StopMotor('BC');
                    pause(.23);

                    % turn right
                    brick.MoveMotor('B', 98);
                    brick.MoveMotor('C', -100);
                    pause(.242);
                    brick.StopMotor('BC');
                    pause(0.3);

                    % go forward
                    brick.MoveMotor('B', -80);
                    brick.MoveMotor('C', -82);
                    pause(.7);


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
            brick.MoveMotor('B', 28);
            brick.MoveMotor('C', -25.2);
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
            % stop
        case 'x'
            brick.StopMotor('ABC');
            startMoving = 0;


    end
end

CloseKeyboard();
