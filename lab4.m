
function lab4

pinL1       = 52;
pinL2       = 53;
pinSTEN1    = 50;
pinSTEN2    = 51;
pinSAX1     = 48;
pinSAX2     = 49;
pinPASE1    = 46;
pinPASE2    = 47;

%a = arduino_com('COM6');

%init pins
%pinMode(a,pinL1,'OUTPUT');
%pinMode(a,pinL2,'OUTPUT');
%pinMode(a,pinSTEN1,'INPUT');
%pinMode(a,pinSTEN2,'INPUT');
%pinMode(a,pinSAX1,'INPUT');
%pinMode(a,pinSAX2,'INPUT');
%pinMode(a,pinPASE1,'INPUT');
%pinMode(a,pinPASE2,'INPUT');

%create matrises to hold score. 
%score(1,1) is player 1 and score(2,2) is player 2
score = zeros(2,2);

%namnSpelare1 = input('Player1 name: ','s');
%namnSpelare2 = input('Player2 name: ','s');
%counter = 0;

%checking status on buttons
%STEN1 = digitalRead(a,pinSTEN1);
%STEN2 = digitalRead(a,pinSTEN2);
%SAX1 = digitalRead(a,pinSAX1);
%SAX2 = digitalRead(a,pinSAX2);
%PASE1 = digitalRead(a,pinPASE1); 
%PASE2 = digitalRead(a,pinPASE2);

%test1 = disp(hej);

play = 1;

%while not all buttons are pressed
%while (play)
 %  while ~(STEN1 && SAX1 && PASE1 && STEN2 && SAX2 && PASE2)
  % end
   
%end
counter = 0;
while(play)
    disp (x);
    foo1
    foo2
    counter = counter + 1;
    if (counter == 5)
        play = 0;
    end
end

    function foo1
        static x = 0;
    end
    function foo2
        x = x + 10;
    end

function updatePins
    STEN1 = digitalRead(a,pinSTEN1);
    STEN2 = digitalRead(a,pinSTEN2);
    SAX1 = digitalRead(a,pinSAX1);
    SAX2 = digitalRead(a,pinSAX2);
    PASE1 = digitalRead(a,pinPASE1); 
    PASE2 = digitalRead(a,pinPASE2);
    
end

end


