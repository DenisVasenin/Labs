/*
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
*/


void GetString(char *String, int Len) {
	char Trash[1000];
	fgets(String, Len, stdin);
	if (!strstr(String, "\n")) {
		fgets(Trash, 900, stdin);
	}
	String[strlen(String)-1] = '\0';
}


int ForSwitch(char *String) {
	if (!(strcmp(String, "hello\n"))) return(1);
	if (!(strcmp(String, "exit\n"))) return(2);
	return(0);
}


/*
 Проверить вхождение подстроки в начало строки.
 В качестве аргументов принимает две строки.
 Возвращает 1 если подстрока находится в начале строки и 0 в других случаях.
 Пример:
		char String1[] = "input=/home/user", String2[] = "input="; int State;
		State = StrStr(String1, String2);
*/

int StrStr(char *String1, char *String2) {
	char *p1, *p2;
	p1 = String1;
	p2 = strstr(String1, String2);
	if (p1 == p2) return(1);
	return(0);
}
