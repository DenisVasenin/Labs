// Составить таблицу функции, заданную конечной суммой.
// Под выньдос. Задание 15.
 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>
#include "logo.h"
#include "zast.h"

#define e 0.001
#define pi 3.14
 
int main(int argc, char *argv[])
{
	logo(); zast();

	int n = 1, i;
	double Y, Sum, El;
	double H = pi / 10;
	double X = pi / 5;
	printf("%s", "     X        Y\n");
	printf("%s", "--------------------\n");
	while (X <= pi)
	{
		i++;
		Y = 0.25 * (powf(X, 2) - powf(pi, 2) / 3);
		El = powf(-1, n) * (cosf(n * X) / powf(n, 2));
		//printf("%s%lf\n", "El - ", El);
		while (fabs(El) >= e)
		{
			n = n + 1;
			Sum = Sum + El;
			El = powf(-1, n) * (cosf(n * X) / powf(n, 2));
		}
		printf("| %6.3lf | %6.4lf |\n", X, X);
		//printf("%s%lf\n", "Sum=", Sum);
		//if (Y == Sum) printf("%s\n", "YES"); 
		//else printf("%s\n", "NONE");
		X = X + H;
		n = 1; Sum = 0; El = 0;
		//puts("");
	}
	puts("");
	puts("Press any key.");
	getchar();
	return(0);
}

