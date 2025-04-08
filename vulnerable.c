#include <stdio.h>
#include <string.h>

void lost()
{
    puts("Wrong password\n");
}

void win()
{
    puts("You shouldn't be here!");
}

void handle_input()
{
    char input[100];

    puts("Enter the password: ");
    gets(input);

    char correct_password[] = "secret";

    if (strcmp(input, correct_password) == 0)
    {
        puts("Access granted\n");
    }
    else
    {
        lost();
    }
}

int main()
{
    handle_input();
    return 0;
}