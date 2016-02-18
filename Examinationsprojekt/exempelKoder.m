%% Kod för att connecta till arduino samt skicka en text azazazaz
% Summary of example objective

s = serial('com3', 'BaudRate', 9600); fopen(s); fprintf(s, 'azazazaz'); fclose(s);



%% Section 1 Title
% Description of first code block
A = fscanf(obj) reads ASCII data from the device connected to the serial port object, obj, and returns it to A. The data is converted to text using the %c format. For binary data, use fread.
A = fscanf(obj,'format') reads data and converts it according to format. format is a C language conversion specification. Conversion specifications involve the % character and the conversion characters d, i, o, u, x, X, f, e, E, g, G, c, and s. Refer to the sscanf file I/O format specifications or a C manual for more information.
example:    A = sscanf(s,'%f')
A = fscanf(obj,'format',size) reads the number of values specified by size. Valid options for size are:

%s Read series of characters, until find white space.
%c Read any single character, including white space.
%[...] Read only characters in the brackets, until the first nonmatching character or white space.
(To read multiple characters, specify field length.)
%% Section 2 Title
% Description of second code block
a=2;
