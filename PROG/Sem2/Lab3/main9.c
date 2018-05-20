#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "Main9Func.h"

#define true 1

int main(void) {
	char StrGrp[1000], StrUsr[1000], StrOut[1000];
	int IDG = 0, Max = 0, Num = 0;
	FILE *Usr, *Grp, *Out;
////////////////////////////////////////////////////////////////////////////////////
	Logo();
	system("cat /etc/passwd | awk -F \":\" \'{print $4\":\"$1}\' > users");
	system("cat /etc/group | awk -F \":\" \' { print $3\":\"$1\":\"$4}\' > groups");
	OpenFileR("users", &Usr);
	OpenFileR("groups", &Grp);
	OpenFileW("out", &Out);
	while (true) {
		fgets(StrGrp, 800, Grp);
		if (feof(Grp)) break;
		GetGroups(StrGrp, Out);
		IDG = GetGID(StrGrp);
		while (true) {
			fgets(StrUsr, 800, Usr);
			if (feof(Usr)) break;
			GetUsers(StrUsr, IDG, Out);
		}
		fprintf(Out, "\n");
		rewind(Usr);
	} 
	rewind(Out);
	while (true) {
		fgets(StrOut, 800, Out);
		if (feof(Out)) break;
		Num = CountUsers(StrOut);
		if (Num > Max) Max = Num;
	}
	rewind(Out);
	while (true) {
		fgets(StrOut, 800, Out);
		if (feof(Out)) break;
		PrintUsers(StrOut, Max);
	}
	fprintf(stdout, "\n\n");
	CloseFile(&Usr);
	CloseFile(&Grp);
	CloseFile(&Out);
	return(0);
}