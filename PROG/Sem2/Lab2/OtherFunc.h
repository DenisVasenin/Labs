void PrintTime(FILE *File) {
	time_t t;
	struct tm *ptr;
	char Time[30];
	t = time(NULL);
	ptr = localtime(&t);
	strftime(Time, 50, "[%d.%m.%Y %H:%M:%S] : ", ptr);
	fprintf(File, Time);
}

void GetString(char *String, int Len) {
	char Trash[1000];
	fgets(String, Len, stdin);
	if (!strstr(String, "\n")) {
		fgets(Trash, 800, stdin);
	}
	String[strlen(String)-1] = '\0';
}

void WriteSign(char *Sig, FILE *File, FILE *Log) {
	if ((fwrite(Sig, sizeof(char), 7, File)) == 8) {
		PrintTime(Log);
		fprintf(Log, "Сигнатура успешно записана.\n");
	}
}

int CheckSign(char *Sig, FILE *File, FILE *Log) {
	char SigCh[10];
	fread(SigCh, sizeof(char), 7, File);
	if (!(memcmp(SigCh, Sig, 7))) {
		PrintTime(Log);
		fprintf(Log, "Сигнатура успешно прочитана.\n");
		return(1);
	} else {
		PrintTime(Log);
		fprintf(Log, "Сигнатура не найдена.\n");
		return(0);
	}
}

int OpenFile(char *FileName, FILE **File, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if ((*File = fopen(FileName, "rb+")) == NULL) {
		PrintTime(Log);
		fprintf(Log, "Ошибка при открытии файла \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Файл \"%s\" открыт успешно.\n", FileName);
		return(1);
	}
}

int CloseFile(char *FileName, FILE **File, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if (fclose(*File))  {
		PrintTime(Log);
		fprintf(Log, "Ошибка при закрытии файла \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Файл \"%s\" закрыт успешно.\n", FileName);
		return(1);
	}
}

int CreateFile(char *FileName, FILE *Log) {
	FILE *File = NULL;
	if (Log == NULL) Log = stderr;
	if ((File = fopen(FileName, "rb")) == NULL) {
		if ((File = fopen(FileName, "wb")) == NULL) {
			PrintTime(Log);
			fprintf(Log, "Неизвестная ошибка при создании файла \"%s\".\n", FileName);
			return(0);
		} else {
			fclose(File);
			PrintTime(Log);
			fprintf(Log, "Файл \"%s\" создан успешно.\n", FileName);
			return(1);
		}
	} else {
		fclose(File);
		PrintTime(Log);
		fprintf(Log, "Создаваемый файл \"%s\" уже существует.\n", FileName);
		return(0);
	}
}

int DeleteFile(char *FileName, FILE *Log) {
	if (Log == NULL) Log = stderr;
	if (remove(FileName)) {
		PrintTime(Log);
		fprintf(Log, "Ошибка при удалении файла \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Файл \"%s\" удалён успешно.\n", FileName);
		return(1);
	}
}

int OpenLog(char *FileName, FILE **Log) {
	if ((*Log = fopen(FileName, "a")) == NULL) {
		PrintTime(stderr);
		fprintf(stderr, "Ошибка при открытии файла \"%s\".\n\n", FileName);
		return(0);
	} else {
		PrintTime(stderr);
		fprintf(stderr, "Файл \"%s\" открыт успешно.\n\n", FileName);
		return(1);
	}
}

void Invite(void) {
	system("clear");
	fprintf(stdout, ">> ");
}

int ForSwitch(char *String) {
	if (!(strcmp(String, "help"))) return(1);
	if (!(strcmp(String, "exit"))) return(2);
	if (!(strcmp(String, "createbase"))) return(3);
	if (!(strcmp(String, "seekbase"))) return(4);
	if (!(strcmp(String, "openbase"))) return(5);
	if (!(strcmp(String, "printbase"))) return(6);
	if (!(strcmp(String, "lenbase"))) return(7);
	if (!(strcmp(String, "closebase"))) return(8);
	if (!(strcmp(String, "deletebase"))) return(9);
	if (!(strcmp(String, "addrecord"))) return(10);
	if (!(strcmp(String, "searchrecord"))) return(11);
	if (!(strcmp(String, "printrecord"))) return(12);
	if (!(strcmp(String, "deleterecord"))) return(13);
	return(0);
}

int IsIntPos(char *String) {
	int Count;
	for (Count = 0; Count < (strlen(String)-1); Count++) {
		if (!isdigit(String[Count])) return(0);
	}
	return(1);
}
