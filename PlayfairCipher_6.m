fprintf("Input of the plaintext cannot \n(1) have whitespace character, \n(2)duplicate character side by side\n\n\n");

 %create Char variable from 'ABC....XYZ'
charAlpha = 'A':'Z';    

%Prompt user input for plaintext & key
plainText = input("Enter the plaintext: ", "s");
plainText = upper(plainText);


%If plaintext size is odd, append 'X' to make it even
sizePlainText = strlength(plainText);
if rem(sizePlainText,2) == 1  
    plainText = [plainText 'X']
    sizePlainText = strlength(plainText);
end

key =input("Enter the encryption key: ", "s");
key = char(upper(key));

%concatenate key + charAlpha 
key = strcat(key, charAlpha); 

%iterating through each letter in the plainText variable and change all j to i
for i=1:sizePlainText
    if plainText(i) == 'J'
        plainText(i) = 'I';
    end
end

%iterating through each letter in the key variable and change all j to i
for i=1:sizePlainText
    if key(i) == 'J'
        key(i) = 'I';
    end
end

%remove duplicate value frrom key array until only unique values
uniqueKey = unique(key, 'stable');  


%Crreate the 2D array and fill with the uniqueKey value
matrixAlpha = char(zeros(5,5));
i=1;
for r=1:5
    for c=1:5
        matrixAlpha(r,c) = uniqueKey(i);  
        i = i+1;
    end
end



sizePlainText = strlength(plainText);
encryptedText = plainText;
i=1;
while i<sizePlainText      %Algorithm to perform Playfair algorithm based in the 2D array

    flag1 = 0;
    for r1=1:5
        for c1=1:5
            if plainText(i) == matrixAlpha(r1,c1)  %Getting coordinate of matrix that match the first value of the stream
                flag1 = 1;
                break   %escape the col iteration
            end
        end
        if flag1 == 1   %escape the row iteration
            break
        end
    end
    
    flag2 = 0;
    for r2=1:5
        for c2=1:5
            if plainText(i+1) == matrixAlpha(r2,c2)  %Getting coordinate of matrix that match the second value of the stream
               flag2 = 1;
                break
            end
        end
        if flag2 == 1   
            break
        end
    end

    %Substituing Value
    if r1 == r2     %(1)if the row are the same 
        if c1 == 5
            c1 = 1;
            c2 = c2 + 1;
        elseif c2 == 5
            c2 = 1;
            c1 = c1 + 1;
        else
            c1 = c1 + 1;
            c2 = c2 + 1;
        end
    
    elseif c1 == c2   %(2)if the column are the same
        if r1 == 5
            r1 = 1;
            r2 = r2 + 1;
        elseif r2 == 5
            r2 = 1;
            r1 = r1 + 1;
        else
            r1 = r1 + 1;
            r2 = r2 + 1;
        end


    else  %(3)If the colum and row are not the same
        temp1 = c1;
        temp2 = c2;
        c1 = temp2;
        c2 = temp1;
    end
    
    %perform the subsitution on the plaintext
    encryptedText(i) = matrixAlpha(r1,c1);
    encryptedText(i+1) = matrixAlpha(r2,c2);
    i = i+2;
end

%Display the plaintext & ciphertext
fprintf("\n\nPlain-Text: %s\n", plainText);
fprintf("Cyper-Text: %s\n", encryptedText);




