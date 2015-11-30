function Funktionstest()
pinL1       = 44;
pinL2       = 45;
pinSTEN1    = 50;
pinSTEN2    = 51;
pinSAX1     = 48;
pinSAX2     = 49;
pinPASE1    = 46;
pinPASE2    = 47;

a = arduino_com('COM6');

pinMode(a,pinL1,'OUTPUT');
pinMode(a,pinL2,'OUTPUT');

pinMode(a,pinSTEN1,'INPUT');
pinMode(a,pinSTEN2,'INPUT');
pinMode(a,pinSAX1,'INPUT');
pinMode(a,pinSAX2,'INPUT');
pinMode(a,pinPASE1,'INPUT');
pinMode(a,pinPASE2,'INPUT');

display('Sätt alla knappar till av!');
display('Tänder spelare 1 lampa!');

digitalWrite(a,pinL1,1);

display('Spelare 1 ställ på STEN');

while(~digitalRead(a,pinSTEN1))
end

display('Spelare 1 ställ på SAX');

while(~digitalRead(a,pinSAX1))
end

display('Spelare 1 ställ på PÅSE');

while(~digitalRead(a,pinPASE1))
end

display('Tänder spelare 2 lampa, släcker spelare 1 lampa!');

digitalWrite(a,pinL1,0);
digitalWrite(a,pinL2,1);

display('Spelare 2 ställ på STEN');

while(~digitalRead(a,pinSTEN2))
end

display('Spelare 2 ställ på SAX');

while(~digitalRead(a,pinSAX2))
end

display('Spelare 2 ställ på PÅSE');

while(~digitalRead(a,pinPASE2))
end

display('Allt funkar!')

delete(a);
end
