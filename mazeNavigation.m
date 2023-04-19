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



while 1
    pause(0.1);




    switch key

        case 'uparrow'
            while(startMoving == 0)
                pause(.4);
                brick.MoveMotor('BC', -80);
                brick.MoveMotor('B', -80);
                brick.MoveMotor('C', -81.5);
                
                touch = brick.TouchPressed(3);
                touch1 = brick.TouchPressed(1);
                %



                distance = brick.UltrasonicDist(4);

                if key == 'x'
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
                    pause(.222);
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
  

    end
end

CloseKeyboard();
