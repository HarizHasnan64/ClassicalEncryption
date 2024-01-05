disp('Welcome to the\n Encryption Program.');

flag = 1;
while flag == 1;

    fprintf('Please select the following options:\n1. Ceaser Encryption\n2. Shift Encryption');
    fprintf('\n3. Mono-Alphabetic Encryption\n4. Poly-Alphabetic Encryption\n5. AutoKey Encryption');
    fprintf('\n6. Playfair Encryption\n7. Hill Encryption\n8. OneTimePad Encryption');
    fprintf('\n9. Rail-Fence Encryption\n10.Row-Transposition Encryption');
    fprintf('\n0. EXIT\n\n');


    userInput = input('Enter a number between 1 and 10: ');

% Check the input using a switch statement
    switch userInput
    
        case 1
            disp('You chose Ceaser Encryption.');
            run('CaeserCipher_1');
    
    
        case 2
            disp('You chose Shift Encryption.');
            run('ShiftCipher_2');
    
    
        case 3
            disp('You chose Mono-Alphabetic Encryption.');
            run('MonoAlphabeticCipher_3');
    
    
        case 4
            disp('You chose Poly-Alphabetic Encryption.');
            run('PolyAlphabeticCipher_4');
    
    
        case 5
            disp('You chose AutoKey Encryption.');
            run('AutoKeyCipher_5');
    
    
        case 6
            disp('You chose Playfair Encryption.');
            run('PlayfairCipher_6');
    
    
        case 7
            disp('You chose Hill Encryption.');
            run('HillCipher_7');
    
    
        case 8
            disp('You chose OneTimePad Encryption.');
            run('OneTimePadCipher_8');
    
    
        case 9
            disp('You chose Rail-Fence Encryption.');
            run('RailFenceCipher_9');
    
    
        case 10
            disp('You chose Row-Transposition Encryption.');
            run('RowTranspositionCipher_10');
    
        case 0
            disp('You chose option 10. Exting the program...');
            flag = 0;
    
        otherwise
            disp('Invalid input. Please enter a number between 1 and 10.');
    end


end