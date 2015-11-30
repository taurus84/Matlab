
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

play = 1;

%while not all buttons are pressed
updatePins
while (play)
   %check all buttons are null
   while (STEN1 || SAX1 || PASE1 || STEN2 || SAX2 || PASE2)
       updatePins
   end
   %get ready
   blink3Times
   
   %check if both players have made choices
   while ~((STEN1 || SAX1 || PASE1) && (STEN2 || SAX2 || PASE2))
       updatePins
   end
   
   
   if(checkCheating)
       if(FUSK1 && FUSK2)
           %set both players score to zero
           score(1,1) = 0;
           score(2,2) = 0;
       elseif(FUSK1)
           score(2,2) = score(2,2) + 1;
       else
           score(1,1) = score(1,1) + 1;
       end

   %player1 wins round    
   elseif(bla)
       
   %player2 wins round    
   elseif(bla)
   
   %draw
   else
       
   end
   
   
end

    function output = checkCheating
    %returns true if someone cheated
        FUSK1 = STEN1 && (SAX1 || PASE1) || (SAX1 && PASE1);
        FUSK2 = STEN2 && (SAX2 || PASE2) || (SAX2 && PASE2);
        output = FUSK1 || FUSK2;
    end

    

function updatePins
    STEN1 = digitalRead(a,pinSTEN1);
    STEN2 = digitalRead(a,pinSTEN2);
    SAX1 = digitalRead(a,pinSAX1);
    SAX2 = digitalRead(a,pinSAX2);
    PASE1 = digitalRead(a,pinPASE1); 
    PASE2 = digitalRead(a,pinPASE2);
    if(STEN1 && STEN2 && SAX1 && SAX2 && PASE1 && PASE2)
        play = 0;
    end
    
end

function blink3Times
%let lamps blink 3 times
    for k = 1:3
    digitalWrite(a,pinL1,1);    %lights on
    digitalWrite(a,pinL2,1);

        if(k < 3)
            pause(1);   
            digitalWrite(a,pinL1,0); %lights off
            digitalWrite(a,pinL2,0);    
            pause(1);
        end
    end
end


end




