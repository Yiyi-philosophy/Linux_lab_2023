#include <stdlib.h> 
#include <stdio.h> 
#include <string.h> 

#include <unistd.h> 
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>

int main(){
    char *arg_cd[]={"cd","./src",NULL};
    char *arg_ls[]={ls",NULL};
    printf("begin testing ...\n");

    pid_t pid = fork();
    if(pid==0){
        execvp("cd", arg_cd);
        pid_t pid2 = fork();
        if(pid==0){
            execvp("ls", arg_ls);
            exit(1);
        }
    }
    return 0;
}