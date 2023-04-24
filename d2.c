#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

// Function to check if a number is prime or not
int isPrime(int n)
{
    if (n <= 1)
    {
        return 0;
    }

    for (int i = 2; i * i <= n; i++)
    {
        if (n % i == 0)
        {
            return 0;
        }
    }

    return 1;
}

int main()
{
    int start = 1;
    int end = 100000;
    int num_processes = 10;
    int chunk_size = (end - start + 1) / num_processes;

    for (int i = 0; i < num_processes; i++)
    {
        int pid = fork();

        if (pid < 0)
        {
            fprintf(stderr, "Fork Failed\n");
            exit(1);
        }
        else if (pid == 0)
        {
            // Child process
            int child_start = start + i * chunk_size;
            int child_end = child_start + chunk_size - 1;

            for (int j = child_start; j <= child_end; j++)
            {
                if (isPrime(j))
                {
                    printf("%d\n", j);
                }
            }

            exit(0);
        }
        else
        {
            // Parent process
            // Do nothing, continue to create next child process
        }
    }

    // Wait for all child processes to finish
    for (int i = 0; i < num_processes; i++)
    {
        wait(NULL);
    }

    return 0;
}
