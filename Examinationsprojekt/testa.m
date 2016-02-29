%program allready connected to arduino, due to 'a' as argument
%Before calling this function, one must use command:
% a  = arduino_com('COMPORT')

%s = serial('com3', 'BaudRate', 115200); fopen(s); fprintf(s, 'azazazaz'); fclose(s);

function [] = testa( a )
    
    RUN = 1;
    %flush(a);

    while(1)
        while(RUN)
            A = importdata('regulator1.txt');
            for i = 1:(size(A))
                str = A(i);
                fprintf(a, str);                
            end
            
            str = fscanf(a,'%c');
            
            if(~isempty(str))
                %number = str2num('str');
                disp(['Received string: ' str ])
            end
   
        end

     
 
    end

end

