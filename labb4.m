function labb4
% Klassiska spelet sten, sax, påse. 
% Till spelet behövs en Arduino Due och spelknappar. 

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

%create 3x3 cells to hold players and score. 
playerAndScore = cell(3,3);
playerAndScore{2,1} = 'Last Round';
playerAndScore{3,1} = 'Total Score';
playerAndScore{1,2} = input('Player1 name: ','s');
playerAndScore{1,3} = input('Player2 name: ','s');
playerAndScore{2,2} = 0;               %Player 1 last round result
playerAndScore{2,3} = 0;               %Player 2 last round result
playerAndScore{3,2} = 0;               %Player 1 total score
playerAndScore{3,3} = 0;               %Player 2 total score

play = 1;
STEN1 = 0;
SAX1 = 0;
PASE1 = 0;
STEN2 = 0;
SAX2 = 0;
PASE2 = 0;

disp('Wait for players...')
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
           playerAndScore{3,2} = 0;
           playerAndScore{3,3} = 0;
           %set last result, both cheated
           playerAndScore{2,2} = 'Cheat';
           playerAndScore{2,3} = 'Cheat';
       elseif(FUSK1)
            playerAndScore{3,3} = playerAndScore{3,3} + 1;
            %set last result
            playerAndScore{2,2} = 'Cheat';
            playerAndScore{2,3} = 'Win';
       else
           playerAndScore{3,2} = playerAndScore{3,2} + 1;
           %set last result
           playerAndScore{2,2} = 'Win';
           playerAndScore{2,3} = 'Cheat';
       end

   %player1 wins round    
   elseif(((STEN1 && SAX2) || (SAX1 && PASE2) || (PASE1 && STEN2)) && play)
       playerAndScore{3,2} = playerAndScore{3,2} + 1;
       %set last result
       playerAndScore{2,2} = 'Win';
       playerAndScore{2,3} = 'Lose';
       
   %player2 wins round    
   elseif(((STEN2 && SAX1) || (SAX2 && PASE1) || (PASE2 && STEN1)) && play)
        playerAndScore{3,3} = playerAndScore{3,3} + 1;
        %set last result
        playerAndScore{2,2} = 'Lose';
        playerAndScore{2,3} = 'Win';
   %draw
   elseif(play)
       %do nothing
       %set last result
       playerAndScore{2,2} = 'Tie';
       playerAndScore{2,3} = 'Tie';
   end
   
   % Display match history and current score
   disp(playerAndScore);
end
disp('GAME OVER');
disp(playerAndScore);

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