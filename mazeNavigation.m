global key
InitKeyboard();
% brick = ConnectBrick('OLLIE');
% C motor is left
% B motor is right

startMoving = 0;
rightTurns = 0;
leftTurns = 0;
counter = 0;

while 1
    pause(0.1);




    switch key

        case 'uparrow'
            while(startMoving == 0)
                pause(.5);
                touch = brick.TouchPressed(3);
%                 

                brick.MoveMotor('B', -80);
                brick.MoveMotor('C', -81.8);

                distance = brick.UltrasonicDist(4);

                if key == 'x'
                    brick.StopMotor('BC');
                    startMoving = 1;
                elseif touch == 1
                    % stop moving
                    brick.StopMotor('BC');
                    pause(.5);

                    % reverse to get away from wall
                    brick.MoveMotor('B', 80);
                    brick.MoveMotor('C', 81.2);
                    pause(.3);

                    % stop before turning left
                    brick.StopMotor('BC');
                    pause(.7);

                    % turn left
                    brick.MoveMotor('B', 50);
                    brick.MoveMotor('C', -50.75);
                    pause(.3);

                    % stop turning left
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    pause(0.5);

                    distance = brick.UltrasonicDist(4);
                    touch = brick.TouchPressed(3);


                elseif distance > 40
                    % pause to not turn right away
                    pause(.4);

                    % stop before turning
                    brick.StopMotor('BC');
                    pause(.2);

                    % turn right
                    brick.MoveMotor('B', 50);
                    brick.MoveMotor('C', -51);
                    pause(.375);
                    brick.StopMotor('BC');
                    pause(0.2);

                    % go forward
                    brick.MoveMotor('B', -80);
                    brick.MoveMotor('C', -81.2);
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
    end
end

CloseKeyboard();
