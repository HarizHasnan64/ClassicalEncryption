%Prompt user input for plaintext
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);
sizePlain = strlength(plainText);

flag = 0;
while flag == 0     %Prompt user input for key and loop until size of key = size of text
    key = input("Enter the Key [same size as plainText]: ", "s");
    key = upper(key);
    sizeKey = strlength(key);
    if sizeKey == sizePlain
        break;
    end
end

 % [A == 65 & Z == 90] in ASCII Table
numberASCII = 65;

 %Converting Alphabet ASCII from 65-90 to 0-25
processText = plainText - numberASCII;  
processKey  = key - numberASCII;

processText = processText + processKey; %Add the plaintext and the key
processText = mod(processText, 26);     %applying modulus to maintain number between 0-25

cipherText = char(processText + numberASCII); %Converting from 0-25 to ASCII value

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", cipherText);
