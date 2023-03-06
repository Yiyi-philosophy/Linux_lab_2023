#!/bin/bash
echo "Begin testing ...\n"

list_file = `ls ./src`
for file in list_file
do
    cat a.txt > contain
    if [-e a.txt] && [contain = 'Welcome'] 
    then
        echo "File a.txt is correct!\n"
        if [-e b] && [contain = 'to'] 
        then
            echo "File b is correct!\n"
            if [-e c.c] && [contain = 'Linux 2023'] 
            then
                echo "File c.c is correct!\n"
                echo "All TEST PASS!\n"
            else
                echo "File c.c is wrong!"
            fi
        else
            echo "File b is wrong!"
        fi
    else
        echo "File a.txt is wrong!"
    fi
    
done


echo "Test finished\n"