/*
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
*/


/* 
 Записать текущую дату и время в файл.
 В качестве аргумента принимает указатель на файл или поток.
 Пример:
		PrintTime(stdout);
*/

void PrintTime(FILE *File) {
	time_t t;
	struct tm *ptr;
	char Time[30];
	t = time(NULL);
	ptr = localtime(&t);
	strftime(Time, 50, "[%d.%m.%Y %H:%M:%S] : ", ptr);
	fprintf(File, Time);
}


/* 
 Записать сигнатуру в файл.
 В качестве аргументов принимает указатели на строку с сигнатурой и на файл для записи.
 Пример:
		char Sig[] = "123456";
		WriteSign(Sig, File, Log);
*/

void WriteSign(char *Sig, FILE *File, FILE *Log) {
	if ((fwrite(Sig, sizeof(char), 1, File)) == 1) {
		PrintTime(Log);
		fprintf(Log, "Сигнатура успешно записана.\n");
	}
}


/* 
 Проверить наличие сигнатуры в файле.
 В качестве аргументов принимает указатели на строку с сигнатурой, на проверяемый файл и на файл лога.
 Пример:
		char Sig[] = "123456";
		CheckSign(Sig, File, Log);
*/

int CheckSign(char *Sig, FILE *File, FILE *Log) {
	char SigCh[10];
	fread(SigCh, sizeof(char), 1, File);
	if (!(memcmp(SigCh, Sig, 1))) {
		PrintTime(Log);
		fprintf(Log, "Сигнатура успешно прочитана.\n");
		return(1);
	} else {
		PrintTime(Log);
		fprintf(Log, "Сигнатура не найдена.\n");
		return(0);
	}
}


/* 
 Открыть файл для чтения/записи.
 В качестве аргументов принимает путь к открываемому файлу, и два указателя.
 Возвращает 1 при положительном результате и 0 при отрицательном, а также записывает результаты в лог(или stdout).
 Пример: 
		char FileIn[]= ArgVal; FILE *In = NULL; int State;
		State = OpenFile(FileIn, &In, stdout);
*/

int OpenFile(char *FileName, FILE **File, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if ((*File = fopen(FileName, "r+")) == NULL) {
		PrintTime(Log);
		fprintf(Log, "Error opening file \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Opening file \"%s\" successfully.\n", FileName);
		return(1);
	}
}


/* 
 Закрыть файл.
 В качестве аргументов принимает путь к закрываемому файлу, указатели на закрываемый файл и файл лога.
 Возвращает 1 при положительном результате и 0 при отрицательном, а также записывает результаты в лог(или stdout).
 Пример:
		char FileIn[] = ArgVal; FILE *In = NULL; int State;
		State = OpenFile(FileIn, &In, stdout); 
		State = CloseFile(FileIn, &In, stdout);
*/

int CloseFile(char *FileName, FILE **File, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if (fclose(*File)) {
		PrintTime(Log);
		fprintf(Log, "Error closing file \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Closing file \"%s\" successfully.\n", FileName);
		return(1);
	}
}


/* 
 Создать файл.
 В качестве аргументов принимает путь к создаваемому файлу, и указатель на файл лога.
 Возвращает 1 при положительном результате и 0 при отрицательном, а также записывает результаты в лог(или stdout).
 Пример: 
		char FileNew[]= ArgVal; int State;
		State = CreateFile(FileNew, stdout);
*/

int CreateFile(char *FileName, FILE *Log) {
	FILE *File = NULL;
	if (Log == NULL) Log = stderr;
	if ((File = fopen(FileName, "r")) == NULL) {
		if ((File = fopen(FileName, "w")) == NULL) {
			PrintTime(Log);
			fprintf(Log, "Error creating file \"%s\".\n", FileName);
			return(0);
		} else {
			fclose(File);
			PrintTime(Log);
			fprintf(Log, "Creating file \"%s\" successfully.\n", FileName);
			return(1);
		}
	} else {
		fclose(File);
		PrintTime(Log);
		fprintf(Log, "Created file \"%s\" already exist.\n", FileName);
		return(0);
	}
}


/* 
 Удалить файл.
 В качестве аргументов принимает путь к удаляемому файлу и указатель на файл лога.
 Возвращает 1 при положительном результате и 0 при отрицательном, а также записывает результаты в лог(или stdout).
 Пример:
		char FileDel[] = FileIn; FILE *Log = NULL; int State; 
		State = DeleteFile(FileDel, Log);
*/

int DeleteFile(char *FileName, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if (remove(FileName)) {
		PrintTime(Log);
		fprintf(Log, "Error deleting file \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Deleting file \"%s\" successfully.\n", FileName);
		return(1);
	}
}


/* 
 Открыть файл лога для записи.
 В качестве аргументов принимает путь к открываемому файлу лога и указатель.
 Возвращает 1 при положительном результате и 0 при отрицательном, а также записывает результаты в лог(или stdout).
 Пример: 
		char FileLog[] = ArgVal; FILE *Log = NULL; int State;
		State = OpenLog(FileLog, &Log);
*/

int OpenLog(char *FileName, FILE **Log) {
	if ((*Log = fopen(FileName, "a")) == NULL) {
		PrintTime(stderr);
		fprintf(stderr, "Error opening file \"%s\".\n\n", FileName);
		return(0);
	} else {
		PrintTime(stderr);
		fprintf(stderr, "Opening file \"%s\" successfully.\n\n", FileName);
		return(1);
	}
}


/* 
 Открыть конфигурационный файл для чтения/записи.
 В качестве аргументов принимает путь к открываемому файлу, и два указателя.
 Возвращают 1 при положительном результате и 0 при отрицательном, а также записывают результаты в лог(или stdout).
 Пример:
		char FileConf[]= ArgVal; FILE *Conf = NULL; int State;
		State = OpenConf(FileConf, &Conf, stdout);
*/

int OpenConf(char *FileName, FILE **File, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if ((*File = fopen(FileName, "r+")) == NULL) {
		PrintTime(Log);
		fprintf(Log, "Error opening file \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Opening file \"%s\" successfully.\n", FileName);
		return(1);
	}
}
