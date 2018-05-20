int OpenFileR(char *FileName, FILE **File) {
	if ((*File = fopen(FileName, "r")) == NULL) return(0);
	else return(1);
}
int OpenFileW(char *FileName, FILE **File) {
	if ((*File = fopen(FileName, "w+")) == NULL) return(0);
	else return(1);
}
int CloseFile(FILE **File) {
	if (fclose(*File)) return(0);
	else return(1);
}
void Logo(void)
{
	puts("");
	puts("                              ============================");
	puts("");
	puts("                                XX  XX  YY  YY  NN    NN  ");
	puts("                                 XXXX    YYYY   NNNN  NN  ");
	puts("                                  XX      YY    NN NN NN  ");
	puts("                                 XXXX     YY    NN  NNNN  ");
	puts("                                XX  XX    YY    NN    NN  ");
	puts("");
	puts("");
	puts("                               Пенкин Станислав гр ИВТ-11 ");
	puts("");
	puts("                              ============================");
	puts("");
	puts("=============================================================================================");
	puts("    Получить список пользователей, относящихся к группе с наибольшим числом пользователей    ");
	puts("=============================================================================================");
	puts("");
}

int GetGroups(char *String, FILE *Out) {
	int Count;
	for (Count = 0; Count < strlen(String)-1; Count++) {
		fputc(String[Count], Out);
		if (String[Count] == ':') 
			if (String[Count+1] == '\n') return(0);
	}
	fprintf(Out, ",");
	return(0);
}

int GetGID(char *String) {
	char Num[1000]; 
	int Count;
	for (Count = 0; Count < strlen(String)-1; Count++) {
		if (String[Count] == ':') {
			memcpy(Num, String, Count);
			Num[Count] = '\0';
			return(atoi(Num));
		}
	}
	return(-1);
}

void GetUsers(char *String, int IDG, FILE *Out) {
	int Count, IDU, Trig = 0;
	IDU = GetGID(String);
	if (IDU == IDG) {
		for (Count = 0; Count < strlen(String)-1; Count++) {
			if (Trig == 1) {
				fprintf(Out, "%c", String[Count]);
			}
			if (String[Count] == ':') Trig++;
		}
		fprintf(Out, ",");
	}
}

int CountUsers(char *String) {
	int Count, Num = 0;
	for (Count = 0; Count < strlen(String)-1; Count++) {
		if (String[Count] == ',') Num++;
	}
	return(Num);
}

void PrintUsers(char *String, int Max) {
	int Count, Num = 0, Trig = 0;
	for (Count = 0; Count < strlen(String)-1; Count++) {
		if (String[Count] == ',') Num++;
	}
	if (Num == Max) {
		fprintf(stdout, "Группа: ");
		for (Count = 0; Count < strlen(String)-2; Count++) {
			if (String[Count] == ':') {
				Trig++;
				continue;
			}
			if (Trig == 1) fprintf(stdout, "%c", String[Count]);
			if (Trig == 2) {
				fprintf(stdout, "       Пользователи: ");
				Trig++;
			}
			if (Trig == 3) fprintf(stdout, "%c", String[Count]);
		}
		fprintf(stdout, "\n");
	}
}
