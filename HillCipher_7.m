%Prompt user input for plaintext
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);

%If plaintext size is odd, append 'X' to make it even
sizePlainText = strlength(plainText)
if rem(sizePlainText,2) == 1  
    plainText = [plainText 'X']
    sizePlainText = strlength(plainText);
end

%Prompt user input for the Matrix Key
matrixKey = zeros(2,2); 
for r=1:2
    i = num2str(r);
    for c=1:2
        j = num2str(c);
        matrixKey(r,c) = input(['Enter for matrix[' i ',' j ']: ']);
    end
end

fprintf('\n\n');
disp('Your matrix: ');
matrixKey


arrayAlpha = 'A':'Z';

numASCII = 65; % [A == 65 & Z == 90] in ASCII Table
processText = plainText - numASCII; %Converting Alphabet ASCII from 65-90 to 0-25

%creat 1x2 matrix
tempNum = zeros(1,2);

%HillCipher Algorithmn
i=1;
while i < sizePlainText
    
    %save the two letter in the plaintext
    tempNum(1) = processText(i);
    tempNum(2) = processText(i+1);
    
    %perform matrix operation
    tempNum = tempNum*matrixKey;

    %save the two letter after operation
    processText(i) = tempNum(1);
    processText(i+1) = tempNum(2);
    i = i + 2;
end

processText = mod(processText, 26);            %applying modulus to maintain number between 0-25
encryptedText = char(processText + numASCII);  %Converting Alphabet ASCII from 0-25 to 65-90

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", encryptedText);









