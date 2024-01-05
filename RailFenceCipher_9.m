%Prompt user input for plaintext
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);
sizePlain = strlength(plainText);

key =input("Enter the encryption key: ");

%create character matrix [key x 1]
matrixCha = char(zeros(key,1));


%FailFenceCipher Algorithm
keySize = key;  %No of Row
shift = 1;      % 1: increasing / 0: decreasing
row = 1; 
for i=1:sizePlain
    matrixCha(row, end+1) = plainText(i);

    if row<keySize && shift==1
        row = row + 1;

    elseif row==1 && shift == 0
        row = row + 1
        shift = 1

    elseif row<keySize && shift == 0
        row = row - 1;

    elseif row==keySize && shift == 1
        row = row - 1;
        shift = 0; 
    end
    
    %matrixCha   %Check the shape of the algorithm
end
textProcess = '';

sizeArray = size(matrixCha);  %Obtain the row & column size saved in array[1x2 format]

%convert 2d CHAR array into 1d CHAR array
for r=1:sizeArray(1) 
    for c=1:sizeArray(2)
        textProcess(end+1) = matrixCha(r,c);
        matrixCha(r,c);
    end 
end

%remove whitespace 
numArrayCipher = double(textProcess);
cipherText = '';

size = length(numArrayCipher);
for i=1:size
    if numArrayCipher(i) ~= 0   %[whitespace equal to 0 in numerical value]
        cipherText(end+1) = textProcess(i);
    end
end

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", cipherText);

