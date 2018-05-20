// инвертировать матрицу NхM относительно побочной диагонали
 
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
	for (Count = 0; Count < Row; Count++) {
		for (Count1 = 0; Count1 < Col; Count1++) {
			printf("%5d", Mass[Count][Count1]);
		}
		printf("\n\n");
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
	if (Count1 != 1) {
		for (Count = 1; Count < argc; Count++) { 
			if (strcmp(argv[Count], "hand") == 0) {
				strcpy(Input, "hand");
				break;
			}
		}
		for (Count = 1; Count < argc; Count++) {
			if (strstr(argv[Count], "row=")) {
				if (strlen(argv[Count]) > 6) {
					printf(" Количество строк выбрано автоматически (10). Для справки запустите программу с аргументом help.\n\n");
					break;
				} else {
					strcpy(Temp, argv[Count] + 4);
					Count1 = isint(strlen(Temp), Temp);
					if (Count1 != 1) {
						Row = atoi(argv[Count] + 4);
						if (Row != 0) break;
					}
				}
			}
		}
		if (Row < 2) {
			printf(" Количество строк выбрано автоматически (10). Для справки запустите программу с аргументом help.\n\n");
			Row = 10;
		}
		for (Count = 1; Count < argc; Count++) {
			if (strstr(argv[Count], "col=")) {
				if (strlen(argv[Count]) > 6) {
					printf(" Количество столбцов выбрано автоматически (10). Для справки запустите программу с аргументом help.\n\n");
					break;
				} else {
					strcpy(Temp, argv[Count] + 4); 
					Count1 = isint(strlen(Temp), Temp);
					if (Count1 != 1) {
						Col = atoi(argv[Count] + 4);
						if (Col != 0) break;
					}
				}
			}
		}
		if (Col < 2) {
			printf(" Количество столбцов выбрано автоматически (10). Для справки запустите программу с аргументом help.\n\n");
			Col = 10;
		}
		if (Row == Col) {
			int Mass[Row][Col]; 
			char Mass1[5];
			if (strstr(Input, "hand")) {
				for (Count = 0; Count < Row; Count++) {
					printf(" Заполнение %d-й строки. Введите %d чисел не более 4-x знаков:\n", Count+1, Col);
					Count1 = 0;
					while (Count1 < Col) {
						printf(" Введите %d число: ", Count1+1);
						fgets(Mass1, 5, stdin);
						if (!strstr(Mass1, "\n")) {
							fgets(Temp, 100, stdin);
						}
						Mass1[5] = '\0';
						Count2 = isint(Col, Mass1);
						if (Count2 == 0) {
							Mass[Count][Count1] = atoi(Mass1);
							Count2 = 2;
							Count1++;
						} else {
							printf("\n Ошибка, не верное значение. Введите число еще раз. Для справки запустите программу с аргументом help.\n\n");
						}
					}
					printf("\n");
				}
				if (Count2 == 2) {
					out(Row, Col, Mass);
				}
				printf("\n");
			} else {
				printf(" Матрица была заполнена автоматически. Для справки запустите программу с аргументом help.\n\n");
				srand(time(NULL));
				for (Count = 0; Count < Row; Count++) {
					for (Count1 = 0; Count1 < Col; Count1++) {
						Mass[Count][Count1] = rand() % 9999;
					}
				}
				out(Row, Col, Mass);
			}
		} else {
			printf(" Матрица не квадратная - инвертировать нельзя. Для справки запустите программу с аргументом help.\n\n");
			exit(0);
		}
	}
	printf("\n Нажмите Enter.");
	getchar();
	printf("\n");
	return(0);
}
