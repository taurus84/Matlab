% Function connects to arduino Due 

function a = connectToArduino(COMPORT)

    a = serial('COMXX', 'BaudRate', 9600); 
    set(a, 'Terminator', 10);
    fopen(s);

end

