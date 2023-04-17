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
                pause(.1);
                brick.MoveMotor('B', -80);
                brick.MoveMotor('C', -81);
                
                touch = brick.TouchPressed(3);
                %



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
                    pause(.45);

                    % stop before turning left
                    brick.StopMotor('BC');
                    pause(.3);

                    % turn left
                    brick.MoveMotor('B', -98);
                    brick.MoveMotor('C', 100);
                    pause(.15);

                    % stop turning left
                    brick.StopMotor('BC');
                    pause(0.3);

                    


                elseif distance > 40
                    
                    % pause to not turn right away
                    pause(.4);

                    % stop before turning
                    brick.StopMotor('BC');
                    pause(.22);

                    % turn right
                    brick.MoveMotor('B', 98);
                    brick.MoveMotor('C', -100);
                    pause(.2);
                    brick.StopMotor('BC');
                    pause(0.3);

                    % go forward
                    brick.MoveMotor('B', -80);
                    brick.MoveMotor('C', -81);
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
