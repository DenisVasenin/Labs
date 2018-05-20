// В целочисленном массиве заменить max и min средним арифметическим оставшихся чисел 19

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include "logo.h"
#include "zast.h"

#define Hint " Справка\n\n -- Длина массива задается аргументом len=значение.\n Значение должно быть положительным числом больше нуля, не более 99-ти.\n В противном случае используется длина массива по умолчанию (10).\n Проверка аргументов идет до первого валидного аргумента.\n\n -- Ручное заполнение массива задается аргументом hand.\n В противном случае массив заполняется автоматически.\n\n -- Числа в массиве должны быть целыми положительными, не более 6-ти знаков.\n\n"


int isint(int Len, char Str[Len])
{
	int Count, Res, Ret;
	Len = strlen(Str);
	for (Count = 0; Count < Len-1; Count++) {
		Res = isdigit(Str[Count]);
		if (Res == 0) {
			Ret = 1;
			break;
		} else Ret = 0;
	}
	return(Ret);
}

void out(int Row, int Col, char Mass[Row][Col])
{
	int Int, Max, Min;
	double Sum = 0, Num = 0;
	int Count;
	//int Count1 = 0, Count2 = 0;
	Int = atol(Mass[0]);
	Min = Int; Max = Int;
	for (Count = 1; Count < Row; Count++) {
		Int = atol(Mass[Count]);
		if (Min > Int) Min = Int;
		if (Max < Int) Max = Int;
	}
	printf("\n\n");
}

int main(int argc, char *argv[])
{
	logo(); zast();
	int Row = 10, Col = 7, Count = 0, Count1 = 0, Count2 = 0, Count3 = 0;
	char Input[Col], Temp[100];
	for (Count = 1; Count < argc; Count++) { 
		if (strcmp(argv[Count], "help") == 0) {
			Count1 = 1;
			printf("%s", Hint);
			break;
		}
	}
	printf(" Нажмите Enter.");
	getchar();
	printf("\n");
	return(0);
}
