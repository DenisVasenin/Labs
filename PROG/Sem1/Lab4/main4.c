// В целочисленном массиве заменить max и min средним арифметическим оставшихся чисел

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
	long int Int, Max, Min;
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
	for (Count = 0; Count < Row; Count++) {
		printf("%10d", atoi(Mass[Count]));
		if (atol(Mass[Count]) != Min && atol(Mass[Count]) != Max) {
			Sum += atoi(Mass[Count]);
			Num++;
		} //else {
			//if (atol(Mass[Count]) == Min && Count1 != 1) {
				//Count1 = 1;
			//} else {
				//if (atol(Mass[Count]) == Max && Count2 != 1) {
					//Count2 = 1;
				//} else {
					//Sum += atoi(Mass[Count]);
					//Num++;
				//}
			//}
		//}
	}
	Sum = Sum / Num;
	printf("\n\n");
	//Count1 = 0; Count2 = 0;
	for (Count = 0; Count < Row; Count++) {
		if (atol(Mass[Count]) != Min && atol(Mass[Count]) != Max) printf("%10d", atoi(Mass[Count]));
		else {
			printf("%10.2f", Sum);
			//if (atol(Mass[Count]) == Min && Count1 != 1) {
				//printf("%10.2f", Sum);
				//Count1 = 1;
			//} else {
				//if (atol(Mass[Count]) == Max && Count2 != 1) {
					//printf("%10.2f", Sum);
					//Count2 = 1;
				//} else printf("%10d", atoi(Mass[Count]));
			//}
		}
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
	if (Count1 != 1) {
		for (Count = 1; Count < argc; Count++) { 
			if (strcmp(argv[Count], "hand") == 0) {
				strcpy(Input, "hand");
				break;
			}
		}
		for (Count = 1; Count < argc; Count++) {
			if (strstr(argv[Count], "len=")) {
				if (strlen(argv[Count]) > 6) {
					printf(" Длина массива выбрана автоматически (10). Для справки запустите программу с аргументом help.\n\n");
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
		if (Row == 0) {
			printf(" Длина массива выбрана автоматически (10). Для справки запустите программу с аргументом help.\n\n");
			Row = 10;
		}
		char Mass[Row][Col], Mass1[Col];
		if (strstr(Input, "hand")) {
			printf(" Введите %d чисел не более 6-ти знаков:\n", Row);
			Count = 0;
			while (Count < Row) {
				printf(" Введите %d число: ", Count+1);
				fgets(Mass1, Col, stdin);
				if (!strstr(Mass1, "\n")) {
					fgets(Temp, 100, stdin);
				}
				Count1 = isint(Col, Mass1);
				if (Count1 == 0) {
					for (Count1 = 0; Count1 < Col-1; Count1++) {
						Mass[Count][Count1] = Mass1[Count1];
					}
					Mass[Count][Col] = '\0';
					Count++;
					Count1 = 2;
				} else {
					printf("\n Ошибка, не верное значение. Введите число еще раз. Для справки запустите программу с аргументом help.\n\n");
				}
			}
			printf("\n");
			if (Count1 == 2) {
				out(Row, Col, Mass);
			}
		} else {
			printf(" Массив был заполнен автоматически. Для справки запустите программу с аргументом help.\n\n");
			srand(time(NULL));
			for (Count = 0; Count < Row; Count++) {
				Count2 = 1 + rand() % (Col-2);
				for (Count1 = 0; Count1 < Count2; Count1++) {
					Count3 = rand() % 10;
					Mass[Count][Count1] = Count3 + '0';
				}
				Mass[Count][Count2] = '\0';
			}
			out(Row, Col, Mass);
		}
	}
	printf(" Нажмите Enter.");
	getchar();
	printf("\n");
	return(0);
}
