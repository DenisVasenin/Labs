// Перевести расстояние заданное в морских милях 
// в вид: n километров m метров
// 1 миля = 1852 м

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "logo.h"
#include "zast.h"
 
int main(int argc, char *argv[])
{
	logo(); zast();
	float Ml, Km, Mt; 
	printf("%s", "Введите число морских миль - ");
	if (scanf("%f", &Ml) != 0)
	{
		puts("");
		Mt = Ml*1852; Km = Mt/1000; Mt = Mt-(int)Km*1000;
		printf("Километров - %d, метров - %d\n",(int)Km, (int)Mt);
	}
	else puts("Пожалуйста, ведите число.\n");
	getchar();
	return(0);
}
