#!/bin/bash
echo "Begin testing ..."
path='./src'
list=`ls $path` 
# a b c should pass
# list=`ls ./src_2` b has problem
# list=`ls ./src_2` c.c has problem

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
        # if [ "${file##*/}" = "a.txt" ]
        if [ "$file" = "a.txt" ]
        then
            contain1=`cat $path/$file`
            if [ "$contain1" = "Welcome" ]
            then
                echo "File a.txt is correct!"
                flag1=1
            else
                echo "File a.txt is wrong!"
            fi  

        elif [ "${file##*/}" = "b" ]
        then
            contain2=`cat $path/$file`
            if [ "$contain2" = 'to' ]
            then
                echo "File b is correct!"
                flag2=1
            else
                echo "File b is wrong!"
            fi 

        elif [ "${file##*/}" = "c.c" ]
        then
            contain3=`cat $path/$file`
            if [ "$contain3" = "Linux 2023" ]
            then
                echo "File c.c is correct!"
                flag3=1
            else
                echo "File c.c is wrong!"
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
    echo "Something Wrong"
fi