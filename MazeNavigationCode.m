clc;
lm = 'C';
rm = 'A';


while 3
    brick.SetColorMode(3, 2);
    bumpIntoWall = brick.TouchPressed(1);
    distance = brick.UltrasonicDist(2);
    color = brick.ColorCode(3);
    brick.MoveMotor(rm, -49);
    brick.MoveMotor(lm, -50);
    if color == 5 %red
        brick.StopAllMotors('Brake');
        pause(2);
        brick.MoveMotorAngleRel(rm, 48, -900, 'Brake');
        brick.MoveMotorAngleRel(lm, 51, -900, 'Brake');
        pause(2);
    end
    if distance < 5
        brick.MoveMotorAngleRel(lm, 50, -50, 'Coast');
    end
    if (distance > 45)
        brick.StopAllMotors('Brake');
        pause(3);
        brick.MoveMotorAngleRel(rm, 50, -450, 'Brake');
        brick.MoveMotorAngleRel(lm, 50, -450, 'Brake');
        pause(3);
        brick.StopAllMotors('Brake');
        brick.MoveMotorAngleRel(rm, 50, -450, 'Coast'); %530
        pause(3);
        brick.StopAllMotors('Brake');
        pause(1);
        brick.MoveMotorAngleRel(rm, 48, -500, 'Brake');
        brick.MoveMotorAngleRel(lm, 51, -500, 'Brake');
        pause(3);
        brick.beep();
        bumpIntoWall = false;
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
        brick.MoveMotorAngleRel(rm, 48, -500, 'Brake');
        brick.MoveMotorAngleRel(lm, 51, -500, 'Brake');
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
        brick.beep();
        pause(3);
        brick.MoveMotorAngleRel(lm, 50, -500, 'Brake');
        brick.beep();
        pause(3);
        brick.beep();
        bumpIntoWall = false;
    end
    

end