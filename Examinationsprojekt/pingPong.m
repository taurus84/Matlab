%program allready connected to arduino, due to 'a' as argument
%Before calling this function, one must use command:
% a  = arduino_com('COMPORT')

%s = serial('com3', 'BaudRate', 115200); fopen(s); fprintf(s, 'azazazaz'); fclose(s);

function [] = pingPong( a )
    
    LISTENING = 1;
    SENDING = 0;

    while(1)
        
        
        while(LISTENING)
            %listen to arduino for string, save it to A
            str = fscanf(obj,'%c');
            if(~isempty(str))
                number = str2num('str');
                LISTENING = 0;
                SENDING = 1;
            end
   
        end

        while(SENDING)
            % create String to send
        
            %flush serial output buffer before attempting to send
            flushoutput(a);
        
            %send the string using fprintf
            fprintf(a, string)
        
            % Do some plotting
        end
    
 
    end

end

