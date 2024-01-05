%create Char variable from 'ABC....XYZ'
charAlpha = 'A':'Z';

%Prompt user input for plaintext
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);

%Prompt user input for key
key =input("Enter the encryption key: ", "s");
key = char(upper(key));

%Combine the key variable and charAlpha variable 
key = strcat(key, charAlpha);    
uniqueKey = unique(key, 'stable');   %remove duplicate value frrom key varible until only unique values

 %Create empty string array with length of 26
stringArrayAlpha = strings(26);    
stringArrayUniquKey = strings(26);

%iterating through each letter in the char variable into string array
for i = 1:26
    stringArrayAlpha(i) = charAlpha(i);
    stringArrayUniquKey(i) = uniqueKey(i);
end

%adding ' ' string at the end of the string array
stringArrayAlpha(i+1) = ' '; 
stringArrayUniquKey(i+1) = ' ';

%mapping each letter in the alphabet with the corresponding key
dictionaryMapping = dictionary(stringArrayAlpha, stringArrayUniquKey);


lengthPT = strlength(plainText);    %length of plainText
encryptedText = "";                 %emptry string
for i=1:lengthPT
    %iterate through (1) each letter in the plaintext, 
    %                (2) apply mapping, (3) save in encryptedtext variable          
    encryptedText = strcat(encryptedText, dictionaryMapping(plainText(i)));   %concatenate each encrypted letter
end

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", encryptedText);

