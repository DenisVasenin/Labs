void PrintTime(FILE *Log)
{
	time_t t;
	struct tm *ptr;
	char Time[30];
	t = time(NULL);
	ptr = localtime(&t);
	strftime(Time, 50, "%d.%m.%Y %H:%M:%S : ", ptr);
	fprintf(Log, Time);
}

typedef struct List {
	double data;
	struct List *next;
} List;

List *GetNodeAddr(List *Start, int Num)
{ 
	List *Addr = Start;
	int Count;
	for (Count = 0; Count < Num; Count++) Addr = Addr->next;
	return(Addr);
}

void DeleteNode(List *Head, List *Start, int Num)
{
	List *Prev, *Node;
	Prev = GetNodeAddr(Start, Num-1);
	Node = GetNodeAddr(Start, Num);
	Prev->next = Node->next;
	free(Node);
	Head->data--;
}

List *CreateList(void)
{
	List *Head;
	if ((Head = (List*)malloc(sizeof(List))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	Head -> data = 0;
	Head -> next = NULL;
	return(Head);
}

void DeleteList(List *Head)
{
	while (Head -> data) DeleteNode(Head, Head, 1);
	free(Head);
}

void PrintListData(List *Head)
{
	int Count;
	List *Addr;
	fprintf(stdout, " %p = ", Head -> next);
	for (Count = 1; Count < Head->data; Count++) {
		Addr = GetNodeAddr(Head, Count);
		fprintf(stdout, "%.2f -> %p = ", Addr->data, Addr->next);
	}
	Addr = GetNodeAddr(Head, Count);
	fprintf(stdout, "%.2f -> %p\n\n\n\n", Addr->data, Addr->next);
}

void AddNode(List *Head, int Val)
{
	List *New, *Prev;
	if ((New = (List*)malloc(sizeof(List))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	New -> data = Val;
	New -> next = NULL;
	Prev = GetNodeAddr(Head, Head -> data);
	Prev -> next = New;
	Head -> data++;
}

int StrStr(char *String1, char *String2)
{
	char *p1, *p2;
	p1 = String1;
	p2 = strstr(String1, String2);
	if (p1 == p2) return(1);
	return(0);
}

int IsInt(char *String)
{
	int Count;
	if ((String[0] == '-') && (isdigit(String[1]))) {
		for (Count = 2; Count < (strlen(String)-1); Count++) {
			if (!isdigit(String[Count])) return(0);
		}
	} else {
		for (Count = 0; Count < (strlen(String)-1); Count++) {
			if (!isdigit(String[Count])) return(0);
		}
	}
	return(1);
}

void ReadConf(char *Input, int *Len, int *CNeg, FILE *Conf, FILE *Log)
{
	char Str[100], Temp[100];
	while (!feof(Conf)) {
		fgets(Str, 90, Conf);
		if (StrStr(Str, "input_method=")) strcpy(Input, Str + 13); 
		if (StrStr(Str, "len_list=")) {
			strcpy(Temp, Str + 9);
			*Len = atoi(Temp);
		}
		if (StrStr(Str, "count_neg=")) {
			strcpy(Temp, Str + 10);
			*CNeg = atoi(Temp);
		}
	}
}

void CheckConf(char *Input, int *Len, int *CNeg, FILE *Log)
{
	if (strcmp(Input, "hand")) {
		PrintTime(Log);
		fprintf(Log, "input_method = hand\n");
	} else {
		PrintTime(Log);
		fprintf(Log, "input_method = auto\n");
	}
	if (*Len < 2) {
		*Len = 20;
		PrintTime(Log);
		fprintf(Log, "Bad value of len_list. Value set by default. For help run the program with -help argument.\n");
	}
	PrintTime(Log);
	fprintf(Log, "len_list = %d\n", *Len);
	if (*CNeg > *Len) {
		*CNeg = 3;
		PrintTime(Log);
		fprintf(Log, "Bad value of count_neg. Value set by default. For help run the program with -help argument.\n");
	}
	PrintTime(Log);
	fprintf(Log, "count_neg = %d\n", *CNeg);
}

List *InputAuto(int *Len, int *CNeg, FILE *Log)
{
	List *Head;
	int Count, Data;
	Head = CreateList();
	srand(time(NULL));
	for (Count = 0; Count < *Len; Count++) {
			Data = 5 - rand() % 10;
			AddNode(Head, Data);
		}
	return(Head);
}

List *InputHand(int *Len, int *CNeg, FILE *Log)
{
	List *Head;
	int Count = 1, Count1, Data;
	char Trash[100], Mass[10];
	Head = CreateList();
	fprintf(stdout, " Count numbers in the list - %d.\n\n", *Len);
	while (Count <= *Len) {
		fprintf(stdout, " Enter %d number: ", Count);
		fgets(Mass, 4, stdin);
		if (!strstr(Mass, "\n")) {
			fgets(Trash, 90, stdin);
		}
		Mass[4] = '\0';
		Count1 = IsInt(Mass);
		if (Count1) {
			Data = atoi(Mass);
			AddNode(Head, Data);
			Count++;
		} else fprintf(stdout, "\n Bad data value. Enter the number again. For help run the program with -help argument.\n\n");
	}
	fprintf(stdout, "\n\n");
	return(Head);
}

void Work(int *CNeg, List *Head, FILE *Log)
{
	List *Addr, *First; double Sum = 0;
	int Count, Count1, Trig = 0;
	for (Count = 1; Count <= Head->data; Count++) {
		Addr = GetNodeAddr(Head, Count);
		if ((Addr->data < 0) && (Addr->next == NULL)) Trig++;
		if ((Addr->data < 0) && (Addr->next != NULL)) {
			if (!Trig) First = Addr;
			Trig++;
		} else {
			if (Trig >= *CNeg) {
				Addr = First;
				for (Count1 = 1; Count1 <= Trig; Count1++) {
					Sum += Addr->data;
					Addr = Addr->next;
				}
				Sum = Sum / Trig;
				Addr = First;
				Addr->data = Sum;
				for (Count1 = 1; Count1 <= Trig-1; Count1++) {
					DeleteNode(Head, Addr, 1);
					Count--;
				}
			}
			Sum = 0;
			Trig = 0;
			First = NULL;
		}
	}
}

int CloseFile(char *FileName, FILE **File, FILE *Log)
{
	if (Log == NULL) Log = stderr;
	if (fclose(*File)) {
		PrintTime(Log);
		fprintf(Log, "Error closing file \"%s\".\n", FileName);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Closing file \"%s\" successfully.\n\n", FileName);
		return(1);
	}
}

int OpenLog(char *FileLog, FILE **Log)
{
	if ((*Log = fopen(FileLog, "a")) == NULL) {
		PrintTime(stderr);
		fprintf(stderr, "Error opening file \"%s\".\n\n", FileLog);
		return(0);
	} else {
		PrintTime(stderr);
		fprintf(stderr, "Opening file \"%s\" successfully.\n\n", FileLog);
		return(1);
	}
}

int OpenConf(char *FileConf, char *FileLog, FILE **Conf, FILE *Log)
{
	if (Log == NULL) Log = stderr;
	if ((*Conf = fopen(FileConf, "r")) == NULL) {
		PrintTime(Log);
		fprintf(Log, "Error opening file \"%s\".\n", FileConf);
		PrintTime(stderr);
		fprintf(stderr, "Error opening config file \"%s\".\n\n", FileConf);
		CloseFile(FileLog, &Log, stderr);
		return(0);
	} else {
		PrintTime(Log);
		fprintf(Log, "Opening file \"%s\" successfully.\n", FileConf);
		return(1);
	}
}

int CheckArg(int argc, char *argv[], char *ArgName)
{
	char *p1, *p2;
	int Count;
	for (Count = 1; Count < argc; Count++) {
		p1 = &argv[Count][0];
		p2 = strstr(argv[Count], ArgName);
		if (p1 == p2) return(1);
	}
	return(0);
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
	puts("           ||  В списке целых ненулевых чисел заменить последовательности   ||");
	puts("           || отрицательных чисел с количеством чисел >3 на среднее арифме- ||");
	puts("           || тическое этих чисел.                                          ||");
	puts("           ===================================================================");
	puts("");
	puts(" Благодарность Семенову Диме и Глозштейну Александру Моисеевичу за предоставленные функции.");
	puts("==========================================================================================================");
	puts("");
}

int Help(int *i)
{
	if (*i) {
		puts("==========================================================================================================");
		puts("-- Конфигурационный файл программы находится в папке программы. Без него программа работать не будет.");
		puts("-- Описание параметров находится в конфигурационном файле. В случае если параметры не корректны, программа");
		puts("будет использовать параметры по умолчанию.");
		puts("-- Файл лога программы находится в папке пограммы. ");
		puts("==========================================================================================================");
		puts("");
		return(0);
	}
	return(1);
}
