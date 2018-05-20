// инвертировать матрицу NхM относительно побочной диагонали  17
 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include "logo.h"
#include "zast.h"

#define Hint " HELP\n\n -- Инвертировать можно только квадратную матрицу.\n\n -- Количество строк задается аргументом row=значение.\n Количество столбцов задается аргументом col=значение.\n Значение должно быть положительным числом больше 1-го, не более 99-ти. В противном случае используется значение по умолчанию (10).\n При большом размере матрица может не влезть в ширину экрана - не пугайтесь.\n Проверка аргументов идет до первого валидного аргумента.\n\n -- Ручное заполнение массива задается аргументом hand. В противном случае массив заполняется автоматически.\n\n -- Числа в массиве должны быть целыми положительными, не более 4-х знаков.\n\n"

int isint(int Len, char Str[Len])
{
	int Count, Res, Ret;
	Len = strlen(Str);
	for (Count = 0; Count < Len-1; Count++)
	{
		Res = isdigit(Str[Count]);
		if (Res == 0)
		{
			Ret = 1;
			break;
		} 
		else Ret = 0;
	}
	return(Ret);
}

void out(int Row, int Col, int Mass[Row][Col])
{
	int Temp, Count, Count1, Count2, Count3;
	for (Count = 0; Count < Row; Count++) {
		for (Count1 = 0; Count1 < Col; Count1++) {
			printf("%5d", Mass[Count][Count1]);
		}
		printf("\n\n");
	}
	printf("\n\n");
	Count2 = 0;
	for (Count = 0; Count < Row; Count++) {
		Count2++; Count3 = Row-(Count+1);
		for (Count1 = 0; Count1 < Col-Count2; Count1++) {
			Temp = Mass[Count][Count1];
			Mass[Count][Count1] = Mass[Count+Count3][Count1+Count3];
			Mass[Count+Count3][Count1+Count3] = Temp;
			Count3--;
		}
	}
}

int main(int argc, char *argv[])
{
	logo(); zast();
	int Row = 10, Col = 10, Count = 0, Count1 = 0, Count2 = 0;
	char Input[10], Temp[100];
	for (Count = 1; Count < argc; Count++) { 
		if (strcmp(argv[Count], "help") == 0) {
			Count1 = 1;
			printf("%s", Hint);
			break;
		}
	}
	printf("\n Нажмите Enter.");
	getchar();
	printf("\n");
	return(0);
}
