#include "MainFunc.hpp"
#include "StackFunc.hpp"

int main() {
////////////////////////////////////////////////////////////////////////////////
	char FileConf[] = "config", FileLog[] = "log";
	char Input[100], Trash[100], Mass[10];
	int Count, Count1, Data, i = 0, i1 = 0;
	int StackLen = 30, CountN = 5;

	Stack Stack1, Stack2, Stack3;
	Element* Head1, *Head2, *Head3, *Temp; 
	int *Len = &StackLen, *N = &CountN;
	FILE *Conf = NULL, *Log = NULL;
////////////////////////////////////////////////////////////////////////////////
	Logo();
	openLog(FileLog, &Log);
	if (!openConf(FileConf, FileLog, &Conf, Log)) exit(0);
	readConf(Input, Len, N, Conf, Log);
	checkConf(Input, Len, N, Log);

	Head1 = Stack1.createStack();
	Head2 = Stack2.createStack();
	Head3 = Stack3.createStack();

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
				Stack1.push(Head1, Data);
				Count++;
			} else fprintf(stdout, "\n Bad data value. Enter the number again.\n\n");
		}
		fprintf(stdout, "\n\n");
	}
	else {
		srand(time(NULL));
		for (Count = 0; Count < *Len; Count++) {
			Data = 5 - rand() % 10;
			Stack1.push(Head1, Data);
		}
	}

	fprintf(stdout, "Исходный стек:\n");
	Stack1.printStack(Head1);
	StackLen = Stack1.lengthStack(Head1);
/////////////////////////////////////////////////////////////////
	for (; i < *N; i++) {
		Temp = Stack1.pop(Head1);
		Stack2.push(Head2, Temp);
	}
	for (; i1 < *N; i1++) {
		Temp = Stack2.pop(Head2);
		Stack3.push(Head3, Temp);
	}
	for (; i < (StackLen - *N); i++) {
		Temp = Stack1.pop(Head1);
		Stack2.push(Head2, Temp);
	}
	for (; i1 < (StackLen - *N); i1++) {
		Temp = Stack2.pop(Head2);
		Stack3.push(Head3, Temp);
	}
	for (; i < StackLen; i++) {
		Temp = Stack1.pop(Head1);
		Stack2.push(Head2, Temp);
	}
	for (; i1 < StackLen; i1++) {
		Temp = Stack2.pop(Head2);
		Stack3.push(Head3, Temp);
	}
////////////////////////////////////////////////////////////////
	fprintf(stdout, "\nПолученный стек:\n");
	Stack3.printStack(Head3);
	fprintf(stdout, "\n");

	Stack1.deleteStack(Head1);
	Stack2.deleteStack(Head2);
	Stack3.deleteStack(Head3);
	closeFile(FileConf, &Conf, Log);
	closeFile(FileLog, &Log, stderr);
	return(0);
}

