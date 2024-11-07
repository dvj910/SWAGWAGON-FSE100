clc;
lm = 'D';
rm = 'A';


while 2
    brick.SetColorMode(3, 2);
    bumpIntoWall = brick.TouchPressed(1);
    distance = brick.UltrasonicDist(2);
    color = brick.ColorCode(3);
    brick.MoveMotor(rm, -48);
    brick.MoveMotor(lm, -51);
    if color == 5 %red
        brick.StopAllMotors('Brake');
        pause(1);
        brick.MoveMotorAngleRel(rm, 48, -900, 'Brake');
        brick.MoveMotorAngleRel(lm, 51, -900, 'Brake');
        pause(2);
    end
    if color == 4 %yellow
        brick.StopAllMotors('Brake');
        for i = 1:4
            brick.beep();
            pause(1);
        end
        KeyBoardControls;
    end
    if color == 3 %green
        brick.StopAllMotors('Brake');
        for i = 1:3
            brick.beep();
            pause(1);
        end
        KeyBoardControls;
    end
    if color == 2 %blue
        brick.StopAllMotors('Brake');
        for i = 1:2
            brick.beep();
            pause(1);
        end
        KeyBoardControls;
    end
    if (bumpIntoWall) && (distance < 41)
        brick.StopAllMotors('Brake');
        pause(3);
        brick.MoveMotorAngleRel(rm, 48, 300, 'Brake');
        brick.MoveMotorAngleRel(lm, 51, 300, 'Brake');
        disp('cool');
        brick.beep();
        pause(3);
        brick.MoveMotorAngleRel(rm, 50, 268, 'Brake');
        brick.MoveMotorAngleRel(lm, 50, -268, 'Brake');
        disp('Cooler');
        brick.beep();
        pause(3);
        brick.beep();
        bumpIntoWall = false;
    end
    if (bumpIntoWall) && (distance > 41)
        brick.StopAllMotors('Brake');
        pause(3);
        brick.MoveMotorAngleRel(rm, 48, 300, 'Brake');
        brick.MoveMotorAngleRel(lm, 51, 300, 'Brake');
        disp('cool');
        brick.beep();
        pause(3);
        brick.MoveMotorAngleRel(rm, 50, -250, 'Brake');
        brick.MoveMotorAngleRel(lm, 50, 250, 'Brake');
        disp('Cooler');
        brick.beep();
        pause(3);
        brick.beep();
        bumpIntoWall = false;
    end

end