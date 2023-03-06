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
        contain=`cat ./src/$file`
        if [ -f "./src/a.txt" ] && [ "$contain"="Welcome" ] 
        then
            echo $contain
            echo "File a.txt is correct!"
            flag1=1
            break
        else
            echo "File a.txt is wrong!"
            break
        fi
    done

    unset contain

    for file in $list
    do
        contain=`cat ./src/$file`
        echo $contain
        if [ -f "./src/b" ] && [ "$contain"='to' ] 
        then
            echo $contain
            echo "File b is correct!"
            flag2=1
            break
        else
            echo "File b is wrong!"
            break   
        fi
    done
    
    unset contain
    for file in $list
    do
        contain=`cat ./src/$file`
        if [ -f "./src/c.c" ] && [ "$contain"="Linux 2023" ] 
        then
            echo $contain
            echo "File c.c is correct!"
            flag3=1
            break
        else
            echo "File c.c is wrong!"
            break
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