//          b + b(^2)          3.5 * 10(^-4) + y(^2)   
// B = ------------------- + ------------------------- 
//      e(^y) + sin(^2)2x      sqrt(b * y(^2) + y + 1) 
//                                                     
//      pi         pi                                  
// x = ---- * y + ---- * y + 1                         
//       4          2                                  
//                                                     

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>
#include "logo.h"
#include "zast.h"

#define e 2.71
#define pi 3.14
 
int main(int argc, char *argv[])
{
	logo(); zast();
	float B, b, x, y, si, sq;
	puts("Введите переменные 'y' и 'b'.\n");
	printf("%s", "y = "); scanf("%f", &y);
	printf("%s", "b = "); scanf("%f", &b);
	puts("");
	x = (pi / 4) * y + (pi / 2) + 1;
	si = sinf(2 * x);
	sq = b * powf(y, 2) + y + 1;
	B = (b + powf(b, 2)) / (powf(e, y) + powf(si, 2)) + (3.5 * powf(10, -4) + powf(y, 2)) / sqrtf(sq);
	printf("%s", "x = "); printf("%.2f\n", x);
	printf("%s", "B = "); printf("%.2f\n", B);
	getchar();
	return(0);
}
