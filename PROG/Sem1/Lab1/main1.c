#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "logo.h"
#include "zast.h"
 
int main(int argc, char *argv[])
{
	logo();
	zast();
	if (argc<2)
	{
		printf("Ошибка! Используйте %s eng или %s rus.\n""", argv[0], argv[0]);
		puts("Нажмите Enter");
		getchar();
		exit(0);
	}
	if (argc>2)
	{
		printf("Ошибка! Введите не более одного аргумента.\n""");
		puts("Нажмите Enter");
		getchar();
		exit(0);
	}
	if (strcmp(argv[1], "rus")==0)
	{
		puts("Здравствуйте!\n""");
		puts("Нажмите Enter");
		getchar();
		exit(0);
	}
	if (strcmp(argv[1], "eng")==0)
	{
		puts("Hello!\n""");
		puts("Нажмите Enter");
		getchar();
		exit(0);
	}
	puts("Неизвестный параметр!\n""");
	puts("Нажмите Enter!");
	getchar();
	return(0);
}
