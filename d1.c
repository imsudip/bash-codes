#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
    pid_t pid;

    // create child process
    pid = fork();

    if (pid < 0)
    {
        // error occurred while forking
        fprintf(stderr, "Fork failed");
        exit(-1);
    }
    else if (pid == 0)
    {
        // child process
        printf("Child process: PID = %d, PPID = %d\n", getpid(), getppid());
        exit(0);
    }
    else
    {
        // parent process
        int status;
        printf("Parent process: PID = %d, PPID = %d\n", getpid(), getppid());
        wait(&status);
        printf("Child process exited with status %d\n", status);
    }

    return 0;
}
