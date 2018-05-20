#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include <malloc.h>
#include "Main7Func.h"

int main(int argc, char *argv[])
{
//// Файлы конфига и лога. /////////////////////////////////////////////////////
	char FileConf[] = "config.conf", FileLog[] = "log.txt", Hlp[] = "-help";
	FILE *Conf = NULL, *Log = NULL; List *Head = NULL;
////////////////////////////////////////////////////////////////////////////////
	char Input[100]; 
	int ListLen = 20, CountNeg = 3, State;
	int *Len = &ListLen, *CNeg = &CountNeg;
////////////////////////////////////////////////////////////////////////////////
	Logo();
	OpenLog(FileLog, &Log);
	State = CheckArg(argc, argv, Hlp);
	if (Help(&State)) {
		if (!OpenConf(FileConf, FileLog, &Conf, Log)) exit(0);
		ReadConf(Input, Len, CNeg, Conf, Log);
		CheckConf(Input, Len, CNeg, Log);
		if ((strcmp(Input, "hand\r\n")) == 0) Head = InputHand(Len, CNeg, Log);
		else Head = InputAuto(Len, CNeg, Log);
		fprintf(stdout, "Исходный список:\n");
		PrintListData(Head);
		Work(CNeg, Head, Log);
		fprintf(stdout, "Полученный список:\n");
		PrintListData(Head);
		DeleteList(Head);
		CloseFile(FileConf, &Conf, Log);
	}
	CloseFile(FileLog, &Log, stderr);
	return(0);
}
