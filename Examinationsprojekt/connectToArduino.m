% Function connects to arduino Due 

function a = connectToArduino(COMPORT)

    a = serial(COMPORT, 'BaudRate', 115200); 
    set(a, 'Terminator', 10);
    fopen(a);

end

