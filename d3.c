#include <stdio.h>
#include <unistd.h>
#include <string.h>

#define BUFFER_SIZE 100

int main()
{
    int fd[2]; // file descriptors for the pipe
    pid_t pid;
    char buffer[BUFFER_SIZE]; // buffer to hold the input string

    if (pipe(fd) < 0)
    { // create the pipe
        fprintf(stderr, "Pipe creation failed\n");
        return 1;
    }

    pid = fork(); // create the child process

    if (pid < 0)
    { // fork failed
        fprintf(stderr, "Fork failed\n");
        return 1;
    }
    else if (pid == 0)
    {                 // child process
        close(fd[1]); // close the write end of the pipe
        while (1)
        {
            memset(buffer, 0, BUFFER_SIZE);   // clear the buffer
            read(fd[0], buffer, BUFFER_SIZE); // read from the pipe
            if (strcmp(buffer, "quit") == 0)  // check if input string is "quit"
                break;
            int len = strlen(buffer);
            int i, j;
            for (i = 0, j = len - 1; i < j; i++, j--)
            {
                if (buffer[i] != buffer[j])
                {
                    write(fd[1], "NO", 3); // send "NO" to parent
                    break;
                }
            }
            if (i >= j)
                write(fd[1], "YES", 4); // send "YES" to parent
        }
        close(fd[0]); // close the read end of the pipe
        return 0;
    }
    else
    {                 // parent process
        close(fd[0]); // close the read end of the pipe
        while (1)
        {
            printf("Enter a string: ");
            memset(buffer, 0, BUFFER_SIZE);    // clear the buffer
            fgets(buffer, BUFFER_SIZE, stdin); // read input from user
            buffer[strcspn(buffer, "\n")] = 0; // remove newline character from input
            if (strcmp(buffer, "quit") == 0)   // check if input string is "quit"
                break;
            write(fd[1], buffer, strlen(buffer) + 1); // write to the pipe
            memset(buffer, 0, BUFFER_SIZE);           // clear the buffer
            read(fd[0], buffer, BUFFER_SIZE);         // read from the pipe
            printf("%s\n", buffer);                   // print the response from the child
        }
        close(fd[1]); // close the write end of the pipe
        return 0;
    }
}
