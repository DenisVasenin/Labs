#include "MainFunc.hpp"
#include "ListFunc.hpp"

int main() {
////////////////////////////////////////////////////////////////////////////////
	char FileConf[] = "config", FileLog[] = "log";
	FILE *Conf = NULL, *Log = NULL;
	char Input[100], Trash[100], Mass[10];; int Count, Count1, Data; List List1;
	int ListLen = 30, CountN = 5;
	int *Len = &ListLen, *N = &CountN; Element* Head = NULL;
////////////////////////////////////////////////////////////////////////////////
	Logo();
	openLog(FileLog, &Log);
	if (!openConf(FileConf, FileLog, &Conf, Log)) exit(0);
	readConf(Input, Len, N, Conf, Log);
	checkConf(Input, Len, N, Log);
	Head = List1.createList();
	fprintf(stdout, "Длина списка = %d\n", *Len);
	fprintf(stdout, "Количество чисел (N) = %d\n\n", *N);
	if (strstr(Input, "hand")) {
		Count = 1;
		fprintf(stdout, " Count numbers in the list - %d.\n\n", *Len);
		while (Count <= *Len) {
			fprintf(stdout, " Enter %d number: ", Count);
			fgets(Mass, 4, stdin);
			if (!strstr(Mass, "\n")) {
				fgets(Trash, 90, stdin);
			}
			Mass[4] = '\0';
			Count1 = isInt(Mass);
			if (Count1) {
				Data = atoi(Mass);
				List1.addElement(Head, Data);
				Count++;
			} else fprintf(stdout, "\n Bad data value. Enter the number again.\n\n");
		}
		fprintf(stdout, "\n\n");
	}
	else {
		srand(time(NULL));
		for (Count = 0; Count < *Len; Count++) {
			Data = 5 - rand() % 10;
			List1.addElement(Head, Data);
		}
	}
	fprintf(stdout, "Исходный список:\n");
	List1.printListData(Head);
	ListLen = List1.lengthList(Head);
	for (int i = 0; i < *N; i++) {
		List1.swapElements(Head, i + 1, ListLen - *N + i + 1);
	}
	fprintf(stdout, "Полученный список:\n");
	List1.printListData(Head);
	fprintf(stdout, "\n");
	List1.deleteList(Head);
	closeFile(FileConf, &Conf, Log);
	closeFile(FileLog, &Log, stderr);
	return(0);
}

