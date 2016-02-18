%program allready connected to arduino, due to 'a' as argument
%Before calling this function, one must use command:
% a  = arduino_com('COMPORT')

function [] = pingPong( a )
    
    LISTENING = 1;
    SENDING = 0;

    % Read from I/O port
    while(LISTENING)
        
        
    end

    while(SENDING)
        % create String to send
        
        %flush serial buffer before sending anything
        flush(a);
        
        %send the string using fprintf
        fprintf(a, string)
    end



end

