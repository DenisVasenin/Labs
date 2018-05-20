#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>

void printTime(FILE *Log) {
	time_t t;
	struct tm *ptr;
	char Time[30];
	t = time(NULL);
	ptr = localtime(&t);
	strftime(Time, 50, "%d.%m.%Y %H:%M:%S : ", ptr);
	fprintf(Log, Time);
}

int strStr(char *String1, char *String2) {
	char *p1, *p2;
	p1 = String1;
	p2 = strstr(String1, String2);
	if (p1 == p2) return(1);
	return(0);
}

int isInt(char *String) {
	int Count, Ct;
	Ct = strlen(String)-1;
	if ((String[0] == '-') && (isdigit(String[1]))) {
		for (Count = 2; Count < Ct; Count++) {
			if (!isdigit(String[Count])) return(0);
		}
	} else {
		for (Count = 0; Count < Ct; Count++) {
			if (!isdigit(String[Count])) return(0);
		}
	}
	return(1);
}

int closeFile(char *FileName, FILE **File, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if (fclose(*File)) {
		//printTime(Log);
		//fprintf(Log, "Error closing file \"%s\".\n", FileName);
		return(0);
	} else {
		//printTime(Log);
		//fprintf(Log, "Closing file \"%s\" successfully.\n\n", FileName);
		return(1);
	}
}

int openLog(char *FileLog, FILE **Log) {
	if ((*Log = fopen(FileLog, "a")) == NULL) {
		//printTime(stderr);
		//fprintf(stderr, "Error opening file \"%s\".\n\n", FileLog);
		return(0);
	} else {
		//printTime(stderr);
		//fprintf(stderr, "Opening file \"%s\" successfully.\n\n", FileLog);
		return(1);
	}
}

int openConf(char *FileConf, char *FileLog, FILE **Conf, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if ((*Conf = fopen(FileConf, "r")) == NULL) {
		printTime(Log);
		fprintf(Log, "Error opening file \"%s\".\n", FileConf);
		printTime(stderr);
		fprintf(stderr, "Error opening config file \"%s\".\n\n", FileConf);
		closeFile(FileLog, &Log, stderr);
		return(0);
	} else {
		printTime(Log);
		fprintf(Log, "Opening file \"%s\" successfully.\n", FileConf);
		return(1);
	}
}

void readConf(char *Input, int *Len, int *N, FILE *Conf, FILE *Log) {
	char Str[100], Temp[100], Str1[25]="input_method", Str2[15]="len_list", Str3[15]="count_num";
	while (!feof(Conf)) {
		fgets(Str, 90, Conf);
		if (strstr(Str, Str1)) {
			strcpy(Input, Str + 13);
		} 
		if (strstr(Str, Str2)) {
			strcpy(Temp, Str + 9);
			*Len = atoi(Temp);
		}
		if (strstr(Str, Str3)) {
			strcpy(Temp, Str + 10);
			*N = atoi(Temp);
		}
	}
}

void checkConf(char *Input, int *Len, int *N, FILE *Log) {
	int L = *Len, Nn = *N;
	if (strstr(Input, "hand")) {
		printTime(Log);
		fprintf(Log, "input_method = hand\n");
	} else {
		printTime(Log);
		fprintf(Log, "input_method = auto\n");
	}
	if ((2*Nn) >= L) {
		*Len = 2*Nn + 1;
		printTime(Log);
		fprintf(Log, "Bad value of len_list. Value set as (2*N)+1.\n");
	}
	printTime(Log);
	fprintf(Log, "len_list = %d\n", *Len);
	printTime(Log);
	fprintf(Log, "count_num = %d\n", *N);
}


void Logo(void)
{
	puts("");
	puts("                            ============================");
	puts("");
	puts("                              XX  XX  YY  YY  NN    NN  ");
	puts("                               XXXX    YYYY   NNNN  NN  ");
	puts("                                XX      YY    NN NN NN  ");
	puts("                               XXXX     YY    NN  NNNN  ");
	puts("                              XX  XX    YY    NN    NN  ");
	puts("");
	puts("");
	puts("                             Пенкин Станислав гр ИВТ-11 ");
	puts("");
	puts("                            ============================");
	puts("");
	puts("           ===================================================================");
	puts("       В стеке целых целых чисел поменять местами N первых и N последних элементов\n");
	puts("           ===================================================================");
	puts("");
	puts("==========================================================================================================");
	puts("   Все настройки программы находятся в файле config, который находится в корневой папке программы.\n");
	puts("==========================================================================================================");
	puts("");
}