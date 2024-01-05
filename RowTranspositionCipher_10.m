%Prompt user input for plaintext
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);
sizePlain = strlength(plainText);

%Prompt user input for key[1-9 sequences only][EX: 54321, 264153]
key = input("Enter the Sequence Key[1-9 sequence only]: ", "s");
sizeKey = strlength(key);

%change key variable from char array to num array
numArrayKey = 1:sizeKey;
for i=1:sizeKey
    numArrayKey(i) = str2num(key(i));   
end 

%Determine the size & create the matrix
sizeMatrixRow = ceil(sizePlain/sizeKey); 
sizeMatrixCol = sizeKey;
matrixCha = char(zeros(sizeMatrixRow,sizeMatrixCol));

%Filling the matrix with the letter from the plainText
i=1;
for r=1:sizeMatrixRow
    for c=1:sizeMatrixCol
        if i>sizePlain  %Fill the matrix until the last letter of plaintext
            break
        end
        matrixCha(r,c) = plainText(i);  
        i = i + 1;
    end
end

%Filling the remaining matrix which contain whitespace with 'X'
for r=1:sizeMatrixRow
    for c=1:sizeMatrixCol
        if double(matrixCha(r,c)) == 0   %whitespace is 0 value in numerial]
            matrixCha(r,c) = 'X';
        end
    end
end

%Converting the ciphertext from 2d to 1d array
cipherText = '';
for i=1:sizeKey
    currentColumn = str2double(key(i));
        for r=1:sizeMatrixRow
            cipherText(end+1) = matrixCha(r,currentColumn);
        end 
end

charArrayWithoutSpaces = strrep(string(cipherText), ' ', '');

fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", cipherText);
