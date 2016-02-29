%program allready connected to arduino, due to 'a' as argument
%Before calling this function, one must use command:
% a  = arduino_com('COMPORT')

%s = serial('com3', 'BaudRate', 115200); fopen(s); fprintf(s, 'azazazaz'); fclose(s);

function [] = pingPong( a )
    
    LISTENING = 0;
    SENDING = 1;
    flushinput(a);
    A = importdata('regulator1.txt');
    B = zeros(100,1);
    index = 1;
    index2 = 1;
    %while(1)
    while(SENDING)
            % create String to send
            %sendString = input('Enter text: ', 's');
            %flush serial output buffer before attempting to send
            flushoutput(a);
        
     
            while (index2 < 101)
            str = num2str(A(index2));
             disp(['Sending string: ' str ])
            fprintf(a, str); 
            index2 = index2 + 1;
            flushoutput(a);
            end
            %send the string using fprintf
            %fprintf(a, sendString)
        
            disp(A)
            SENDING = 0;
            LISTENING = 1;
            pause(5);
            disp('Wait for receiving:')
    end
    
        while(LISTENING)
            %listen to arduino for string, save it to A
            
            %disp(['Scanned is: ' str])
            str = fscanf(a,'%c');
            disp(['Received string: ' str ])
            B(index) = str2num(str);
            index = index + 1;
            if(index == 100)
                break
            end
            %if(~isempty(str))
%                 for i = 1:100
%                    
%                     B(i) = 
%                 end
%                 break
                %number = str2num('str');
                %disp(['Received string: ' str ])
                %LISTENING = 0;
                %SENDING = 1;
                %pause(1);
               
            %end  
            %disp(B)
            %disp('Done receiving')
            
            %LISTENING = 0;
            
        end
        disp(B)
        disp('Done receiving')
        pause(1);
        matris = [A B]

        
        
    
 
   %end

end

