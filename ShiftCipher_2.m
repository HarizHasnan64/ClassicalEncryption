%Prompt user input for plaintext
prompt = "Enter the plaintext: ";
plaintext = input(prompt, "s");
plaintext = upper(plaintext);

%Prompt user input for shift key
prompt = "Enter the Shift Key: ";
key = input(prompt, "s");
key = str2num(key);

% [A == 65 & Z == 90] in ASCII Table
num = 65; 

%Converting letters in the plaintext ASCII value from 65-90 to 0-25
process = plaintext - num; 

%Shift letters by the Key
process = process + key; 

%applying modulus to maintain number between 0-25
process = mod(process, 26);  

%Converting from 0-25 to 65-90 in ASCII value
ciphertext = char(process + num); 

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plaintext);
fprintf("Cyper-Text: %s\n", ciphertext);
