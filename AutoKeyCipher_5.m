
%Prompt user input for plaintext & key
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);

key =input("Enter the encryption key: ", "s");
key = char(upper(key));


numberASCII = 65; % [A == 65 & Z == 90] in ASCII Table

%Converting Alphabet ASCII from 65-90 to 0-25
numArrayPlainText = plainText - numberASCII;
numArrayKey = key - numberASCII;

lengthText = length(numArrayPlainText);
lengthKey = length(numArrayKey);

%Ensure that the length of the Key & Test is the same
if lengthKey > lengthText
    numArrayKey = numArrayKey(1:lengthText);

elseif lengthKey < lengthText
    difference = lengthText - lengthKey;
    numArrayKey = [numArrayKey numArrayPlainText(1:difference)];   %concatenating Key Array with part of the PlainText Array
elseif lengthKey == lengthText

end

numArrayEncryptedText = numArrayPlainText + numArrayKey;   %adding the plaintext and key value 
numArrayEncryptedText = mod(numArrayEncryptedText, 26);    %%applying modulus to maintain number between 0-25

ciphertext = char(numArrayEncryptedText + numberASCII); %Converting from 0-25 to ASCII value


%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", cipherText);
