#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include <malloc.h>
#include "StructFunc.h"
#include "OtherFunc.h"
#include "BaseFunc.h"

#define true 1

int main(void) {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	char Command[100];
	char Sig[10] = "170987g";
	char FileLog[]= "log"; FILE *Log = NULL;
	char CurrBase[100]; FILE *CBase = NULL;
	Auto *Head = NULL;
	int State = 0;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	OpenLog(FileLog, &Log);
	while (true) {
		Invite();
		GetString(Command, 50);
		switch (ForSwitch(Command)) {
			case 0:
				Hint();
				getchar();
				break;
			case 1:
				Help();
				getchar();
				break;
			case 2:
				if (!State) {
					Exit();
				} else fprintf(stdout, "\nВ данный момент имеется открытая база.\nЗакройте базу перед выходом.");
				break;
			case 3:
				CreateBase(Sig, Log);
				getchar();
				break;
			case 4:
				SeekBase(Sig, Log);
				getchar();
				break;
			case 5:
				if (!State) {
					State = OpenBase(CurrBase, &CBase, &Head, Sig, Log);
				} else fprintf(stdout, "\nВ данный момент уже имеется открытая база.");
				getchar();
				break;
			case 6:
				if (State) {
					PrintBase(Head);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
			case 7:
				if (State) {
					LengthBase(Head);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
			case 8:
				if (State) {
					State = CloseBase(CurrBase, CBase, Head, Sig, Log);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
			case 9:
				if (!State) {
					DeleteBase(Sig, Log);
				} else fprintf(stdout, "\nВ данный момент имеется открытая база.\nЗакройте все базы, прежде чем удалять.");
				getchar();
				break;
			case 10:
				if (State) {
					AddRecord(Head);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
			case 11:
				if (State) {
					SearchRecord(Head);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
			case 12:
				if (State) {
					PrintRecord(Head);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
			case 13:
				if (State) {
					DeleteRecord(Head);
				} else fprintf(stdout, "\nВ данный момент нет открытой базы.");
				getchar();
				break;
		}
	}
	return(0);
}
