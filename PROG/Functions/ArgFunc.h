/*
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
*/


/*
 Проверить наличие и получить аргумент командной строки.
 В качестве аргументов принимает argc, argv, массив с искомым аргументом и пустой массив под его значение.
 Возвращает 1 если аргумент найден и 0 если не найден. Также возвращает значение аргумента.
 Пример:
		char ArgName[] = "input=", ArgVal[100]; int State;
		State = GetArg(argc, argv, ArgName, ArgVal);
*/

int GetArg(int argc, char *argv[], char *ArgName, char *ArgVal) {
	char *p1, *p2;
	int Count;
	for (Count = 1; Count < argc; Count++) {
		p1 = &argv[Count][0];
		p2 = strstr(argv[Count], ArgName);
		if (p1 == p2) {
			strcpy(ArgVal, argv[Count] + strlen(ArgName));
			return(1);
		}
	}
	return(0);
}


/*
 Проверить наличие аргумента командной строки.
 В качестве аргументов принимает argc, argv и массив с искомым аргументом.
 Возвращает 1 если аргумент найден и 0 если не найден.
 Пример:
		char ArgName[] = "input="; int State;
		State = GetArg(argc, argv, ArgName);
*/

int CheckArg(int argc, char *argv[], char *ArgName) {
	char *p1, *p2;
	int Count;
	for (Count = 1; Count < argc; Count++) {
		p1 = &argv[Count][0];
		p2 = strstr(argv[Count], ArgName);
		if (p1 == p2) return(1);
	}
	return(0);
}
