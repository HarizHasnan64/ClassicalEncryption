
%Prompt user input for plaintext & key
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);

key =input("Enter the encryption key: ", "s");
key = char(upper(key));

 % [A == 65 & Z == 90] in ASCII Table
numberASCII = 65; 


%Converting Alphabet ASCII in plaintext & key from 65-90 to 0-25
numArrayPlainText = plainText - numberASCII; 
numArrayKey = key - numberASCII;

lengthText = length(numArrayPlainText);
lengthKey = length(numArrayKey);

%IF TEXT IS BIGGER - Ensure that the length of the Key & Text is the same
while lengthKey < lengthText
    numArrayKey = [numArrayKey numArrayKey]; %concatenate Key array until it is larger than text array

    lengthText = length(numArrayPlainText);
    lengthKey = length(numArrayKey);
end

 %IF TEXT IS SMALLER - change key array size to the same length as text array
if lengthKey > lengthText
    numArrayKey = numArrayKey(1:lengthText); 
end

numArrayEncryptedText = numArrayPlainText + numArrayKey;   %adding the plaintext and key value 
numArrayEncryptedText = mod(numArrayEncryptedText, 26);    %%applying modulus to maintain number between 0-25

encryptedText = char(numArrayEncryptedText + numberASCII); %Converting from 0-25 to 65-10 in ASCII

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", encryptedText);
