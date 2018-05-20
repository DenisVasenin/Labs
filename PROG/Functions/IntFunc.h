/*
 #include <stdio.h>
 #include <stdlib.h>
 #include <ctype.h>
 #include <string.h>
*/


/*
 Проверить является ли строка целым числом.
 Возвращает 1 если строка содержит целое число и 0 в других случаях.
 Пример:
		char String[] = "1234"; int State;
		State = IsInt(String);
*/

int IsInt(char *String) {
	int Count;
	if ((String[0] == '-') && (isdigit(String[1]))) {
		for (Count = 2; Count < (strlen(String)-1); Count++) {
			if (!isdigit(String[Count])) return(0);
		}
	} else {
		for (Count = 0; Count < (strlen(String)-1); Count++) {
			if (!isdigit(String[Count])) return(0);
		}
	}
	return(1);
}


/*
 Проверить является ли строка целым положительным числом.
 Возвращает 1 если строка содержит целое положительное число и 0 в других случаях.
 Пример:
		char String[] = "1234"; int State;
		State = IsIntPos(String);
*/

int IsIntPos(char *String) {
	int Count;
	for (Count = 0; Count < (strlen(String)-1); Count++) {
		if (!isdigit(String[Count])) return(0);
	}
	return(1);
}


/*
 Проверить является ли строка целым отрицательным числом.
 Возвращает 1 если строка содержит целое отрицательное число и 0 в других случаях.
		char String[] = "-1234"; int State;
		State = IsIntNeg(String);
*/

int IsIntNeg(char *String) {
	int Count;
	if ((String[0] == '-') && (isdigit(String[1]))) {
		for (Count = 2; Count < (strlen(Integer)-1); Count++) {
			if (!isdigit(Integer[Count])) return(0);
		}
	} else return(0);
	return(1);
}


/*
 Проверить является ли строка дробным положительным числом.
 Возвращает 1 если строка содержит дробное положительное число и 0 в других случаях.

int IsPosFloat(char *Float) {
	//int Count, Ret = 1;
	//for (Count = 0; Count < (strlen(Integer) - 1); Count++) {
		//if (isdigit(Integer[Count]) == 0) {
			//Ret = 0;
			//break;
		//}
	//}
	//return(Ret);
}
*/
