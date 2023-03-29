global key
InitKeyboard();
% brick = ConnectBrick('OLLIE');

% set mode to rgb
brick.SetColorMode(2,4);

startMoving = 0;
rightTurns = 0;
leftTurns = 0;
counter = 0;

while 1
    pause(1);
    color =  brick.ColorRGB(2);
    disp(color);

    switch key
        
        case 'uparrow'
            while(startMoving == 0)
                touch = brick.TouchPressed(3);
                
                % rgb are stored in a row vector
                % color(1) = red values
                % color(2) = green values
                % color(3) = blue values
                color = brick.ColorRGB(2);
                brick.MoveMotor('B', -50);
                brick.MoveMotor('C', -50);
                disp(color);

                % kill switch to exit loop
                if touch == 1
                    brick.StopMotor('B');
                    brick.StopMotor('C');
                    startMoving = 1;

                % if red
                elseif (color(1) > 30 && color(2) < 20 && color(3) < 20)

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
