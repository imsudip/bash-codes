#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
    int choice = 0;
    char *args[] = {"", NULL};

    while (1)
    {
        // print the menu
        printf("1. ls\n");
        printf("2. pwd\n");
        printf("3. uname\n");
        printf("4. exit\n");

        // get user's choice
        printf("Enter your choice: ");
        scanf("%d", &choice);

        if (choice < 1 || choice > 4)
        {
            printf("Invalid choice, please try again.\n");
            continue;
        }

        if (choice == 4)
        {
            printf("Exiting program...\n");
            break;
        }

        // create child process
        pid_t pid = fork();

        if (pid == -1)
        {
            perror("fork");
            exit(1);
        }
        else if (pid == 0)
        {
            // child process
            switch (choice)
            {
            case 1:
                args[0] = "ls";
                execv("/bin/ls", args);
                break;
            case 2:
                args[0] = "pwd";
                execv("/bin/pwd", args);
                break;
            case 3:
                args[0] = "uname";
                execv("/bin/uname", args);
                break;
            default:
                exit(0); // should never happen
            }
        }
        else
        {
            // parent process
            wait(NULL);
        }
    }

    return 0;
}
