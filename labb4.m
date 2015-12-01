function labb4

pinL1       = 44;
pinL2       = 45;
pinSTEN1    = 50;
pinSTEN2    = 51;
pinSAX1     = 48;
pinSAX2     = 49;
pinPASE1    = 46;
pinPASE2    = 47;

a = arduino_com('COM6');

%init pins
pinMode(a,pinL1,'OUTPUT');
pinMode(a,pinL2,'OUTPUT');
pinMode(a,pinSTEN1,'INPUT');
pinMode(a,pinSTEN2,'INPUT');
pinMode(a,pinSAX1,'INPUT');
pinMode(a,pinSAX2,'INPUT');
pinMode(a,pinPASE1,'INPUT');
pinMode(a,pinPASE2,'INPUT');

%create cells to hold players and score. 
%pAs(1,1) is player 1 and score(2,2) is player 2
playerAndScore = cell(2,2);
playerAndScore{1,1} = input('Player1 name: ','s');
playerAndScore{2,1} = input('Player2 name: ','s');
playerAndScore{1,2} = 0;
playerAndScore{2,2} = 0;

% A matrix holding score history
matchRecord = zeros(3,100);

% Make a match index and put it as a headline in matrix
t = (1:200);
matchRecord(1,:) = t;

index = 1;
play = 1;

%while not all buttons are pressed
updatePins
while (play)
   %check all buttons are null
   while ((STEN1 || SAX1 || PASE1 || STEN2 || SAX2 || PASE2) && play)
       updatePins
   end
   %get ready
   blink3Times
   
   %check if both players have made choices
   disp('Make your choices!');
   while ((~((STEN1 || SAX1 || PASE1) && (STEN2 || SAX2 || PASE2))) && play)
       updatePins
   end
   
   if(checkCheating && play)
       if(FUSK1 && FUSK2)
           %set both players score to zero
           playerAndScore{1,2} = 0;
            playerAndScore{2,2} = 0;
       elseif(FUSK1)
            playerAndScore{2,2} =  playerAndScore{2,2} + 1;
       else
           playerAndScore{1,2} =  playerAndScore{1,2} + 1;
       end

   %player1 wins round    
   elseif(((STEN1 && SAX2) || (SAX1 && PASE2) || (PASE1 && STEN2)) && play)
       playerAndScore{1,2} = playerAndScore{1,2} + 1;
       disp('Winner is player1 ');
   %player2 wins round    
   elseif(((STEN2 && SAX1) || (SAX2 && PASE1) || (PASE2 && STEN1)) && play)
        playerAndScore{2,2} = playerAndScore{2,2} + 1;
        disp('Winner is player1 ');
   %draw
   elseif(play)
       %do nothing
       disp('Round was TIE');
       
   else
       disp('Game over');
   end
   % Store score data in matchrecord
   matchRecord(2,index) = playerAndScore(1,2);
   matchRecord(3,index) = playerAndScore(2,2);
   
   % Display match history and current score
   disp(matchRecord(1:index));
   disp(playerAndScore);
   
   index = index + 1;
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