global key
InitKeyboard();
% brick = ConnectBrick('OLLIE');

startMoving = 0;
rightTurns = 0;
leftTurns = 0;
counter = 0;

while 1
    pause(0.1);
    distance = brick.UltrasonicDist(4);
    touch = brick.TouchPressed(3);
    disp(touch);




    switch key

        case 'uparrow'
            while(startMoving == 0)
                touch = brick.TouchPressed(3);
%                 

                brick.MoveMotor('B', -47.4);
                brick.MoveMotor('C', -50);

                distance = brick.UltrasonicDist(4);


                if touch == 1

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
