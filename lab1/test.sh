#!/bin/bash
echo "Begin testing ..."

list=`ls ./src`
list_ref=`echo -e 'a.txt\nb\nc.c\n'`

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
            echo "File a.txt is correct!"
            break
        else
            echo "File a.txt is wrong!"
            break
        fi
    done

    # for file in $list
    # do
    #     $contain <./src/$file
    #     if [ -f "b" ] && [ "$contain"='to' ] 
    #     then
    #         echo "File b is correct!"
    #         break
    #     else
    #         echo "File b is wrong!"
    #         break   
    #     fi
    # done

    # for file in $list
    # do
    #     $contain < ./src/$file
    #     if [ -f "c.c" ] && [ "$contain"="Linux 2023" ] 
    #     then
    #         echo "File c.c is correct!"
    #         echo "All TEST PASS!!!"
    #         break
    #     else
    #         echo "File c.c is wrong!"
    #         break
    #     fi
    # done
fi

echo "Test finished"