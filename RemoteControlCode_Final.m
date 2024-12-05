lm = 'C';
rm = 'A';
arm = 'B';


global key;
InitKeyboard();
while 1
    pause(0.1);
    switch key
       case 'w'
           brick.MoveMotorAngleRel(rm, 90, -80, 'Brake');
           brick.MoveMotorAngleRel(lm, 90, -80, 'Brake');
      
       case 's'
           brick.MoveMotorAngleRel(rm, 90, 80, 'Brake');
           brick.MoveMotorAngleRel(lm, 90, 80, 'Brake');
      
       case 'a'
           brick.MoveMotorAngleRel(rm, 90, -30, 'Brake');
           brick.MoveMotorAngleRel(lm, 90, 30, 'Brake');
      
       case 'd'
           brick.MoveMotorAngleRel(rm, 90, 30, 'Brake');
           brick.MoveMotorAngleRel(lm, 90, -30, 'Brake');
       case 'b'
            brick.beep(1);
       case 'uparrow'
           brick.MoveMotorAngleRel(arm, -20, 15, 'Coast');
       case 'downarrow'
           brick.MoveMotorAngleRel(arm, 30, 15, 'Coast');
     
       case 'q'
           break;
   end
end
CloseKeyboard();