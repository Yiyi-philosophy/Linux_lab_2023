#!/bin/bash
echo "Begin testing ..."

list=`ls ./src`
list_ref=`echo -e 'a.txt\nb\nc.c\n'`
flag1=0
flag2=0
flag3=0

if [ "$list" != "$list_ref" ]
then
    echo "Number of files is wrong "
else
    echo "Number of files is correct "
    
    for file in $list
    do
        if "$file" = "a.txt"
        then
            contain1=`cat ./src/$file`
            if "$contain1" = "Welcome"
            then
                echo "File a.txt is correct!"
                flag1=1
                break
            else
                echo "File a.txt is wrong!"
                break 
            fi  

        elif "$file" = "b"
        then
            contain2=`cat ./src/$file`
            if "$contain2" == 'to'
            then
                echo "File b is correct!"
                flag2=1
                break
            else
                echo "File b is wrong!"
                break 
            fi 

        elif "$file" = "c.c"
        then
            contain3=`cat ./src/$file`
            if "$contain3" = 'Linux 2023'
            then
                echo "File c.c is correct!"
                flag3=1
                break
            else
                echo "File c.c is wrong!"
                break
            fi

        else
            continue
        fi
    done
fi

echo "Test finished"
if [ $flag1 -eq 1 ] && [ $flag2 -eq 1 ] && [ $flag3 -eq 1 ]
then 
    echo "All TEST PASS!!!"
else
    echo "Something wrong"
fi