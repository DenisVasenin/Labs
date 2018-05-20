#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

#define Help " -- Программа открывает файл с исходным текстом на Си и выполняет прописаную в нем директиву #define для этого текста.\n -- Путь к исходному файлу и его имя задаются аргументом вида in=/путь/имя. Путь к файлу вывода и его имя задаются аргументом вида out=/путь/имя.\n"

int main(int argc, char *argv[])
{
	FILE *FileIn , *FileOut, *FileLog; fpos_t Pos; time_t LTime;
	int Trig = 0, ErrLog = 0, ErrIn = 0, ErrOut = 0, Count = 0, Count1 = 0, Row = 0, Col = 0;
	char Char, Char1 = '\"', Char2 = '\'', Temp[1000], Def1[100][1000], Def2[100][1000], InName[100], OutName[100];
// ================================ обработка аргументов ====================================
	for (Count = 1; Count < argc; Count++) { 
		if (strcmp(argv[Count], "help") == 0) {
			Trig = 1;
			printf("\n%s\n", Help);
			break;
		}
	}
	if (Trig != 1) {
		if ((FileLog = fopen("Log.txt","w")) == NULL) {
			printf("\n\n Ошибка при создании файла лога.\n\n");
			ErrLog = 1;
		}
		for (Count = 1; Count < argc; Count++) { 
			if (strstr(argv[Count], "in=") > 0) {
				strcpy(InName, argv[Count]+3);
				if ((FileIn = fopen(argv[Count]+3,"r")) == NULL) ErrIn = 1;
				else {
					ErrIn = 0;
					break;
				}
			}
		}
		if (ErrIn == 0) {
			if (ErrLog == 0) {
				LTime = time(NULL);
				fputs(ctime(&LTime), FileLog);
				//fputs("Opening input file successfully.\n\n", FileLog);
				fprintf(FileLog, "Opening input file \"%s\" successfully.\n\n", InName);
			}
		} else {
			printf("\n Ошибка при открытии исходного файла.\n\n");
			if (ErrLog == 0) {
				LTime = time(NULL);
				fputs(ctime(&LTime), FileLog);
				//fputs("Error opening input file.\n\n", FileLog);
				fprintf(FileLog, "Error opening input \"%s\" file.\n\n", InName);
			}
		}
		for (Count = 1; Count < argc; Count++) {
			if (strstr(argv[Count], "out=") > 0) {
				strcpy(OutName, argv[Count]+4);
				if ((FileOut = fopen(argv[Count]+4,"w+")) == NULL) ErrOut = 1;
				else {
					ErrOut = 0;
					break;
				}
			}
		}
		if (ErrOut == 0) {
			if (ErrLog == 0) {
				LTime = time(NULL);
				fputs(ctime(&LTime), FileLog);
				//fputs("Opening output file successfully.\n\n", FileLog);
				fprintf(FileLog, "Opening output file \"%s\" successfully.\n\n", OutName);
			}
		} else {
			printf("\n Ошибка при создании файла вывода.\n\n");
			if (ErrLog == 0) {
				LTime = time(NULL);
				fputs(ctime(&LTime), FileLog);
				//fputs("Error opening output file.\n\n", FileLog);
				fprintf(FileLog, "Error opening output file \"%s\".\n\n", OutName);
			}
		}
// =================================== ищет дефайны =================================================
		if (ErrIn == 0 && ErrOut == 0) {
			while(!feof(FileIn)) {
				Char = fgetc(FileIn);
				if (Char == '#') {
					for (Count = 0; Count < 6; Count++) {
						Temp[Count] = fgetc(FileIn);
						Temp[Count+1] = '\0';
					}
					if (strcmp(Temp, "define") == 0) {
						Char = fgetc(FileIn);
						LTime = time(NULL);
						fputs(ctime(&LTime), FileLog);
						fputs("Define found.\n\n", FileLog);
						while (isspace(Char) != 0) {
							Char = fgetc(FileIn); 
						}
						Col = 0;
						if (Char == Char1 || Char == Char2) {
							if (Char == Char1) {
								do {
									Def1[Row][Col] = Char;
									Col++;
									Def1[Row][Col] = '\0';
									Char = fgetc(FileIn);
								} while (Char != Char1);
							}
							if (Char == Char2) {
								do {
									Def1[Row][Col] = Char;
									Col++;
									Def1[Row][Col] = '\0';
									Char = fgetc(FileIn);
								} while (Char != Char2);
							}
							Def1[Row][Col] = Char;
							Def1[Row][Col+1] = '\0';
							Char = fgetc(FileIn);
						} else {
							while (isspace(Char) == 0) {
								Def1[Row][Col] = Char;
								Col++;
								Def1[Row][Col] = '\0';
								Char = fgetc(FileIn);
							}
						}
						while (isspace(Char) != 0) {
							Char = fgetc(FileIn); 
						}
						Col = 0;
						if (Char == Char1 || Char == Char2) {
							if (Char == Char1) {
								do {
									Def2[Row][Col] = Char;
									Col++;
									Def2[Row][Col] = '\0';
									Char = fgetc(FileIn);
								} while (Char != Char1);
							}
							if (Char == Char2) {
								do {
									Def2[Row][Col] = Char;
									Col++;
									Def2[Row][Col] = '\0';
									Char = fgetc(FileIn);
								} while (Char != Char2);
							}
							Def2[Row][Col] = Char;
							Def2[Row][Col+1] = '\0';
							Char = fgetc(FileIn);
						} else {
							while (isspace(Char) == 0) {
								Def2[Row][Col] = Char;
								Col++;
								Def2[Row][Col] = '\0';
								Char = fgetc(FileIn);
							}
						}
						Row++;
					} 
				}
			}
			rewind(FileIn);
// ========================== выводит до тела и устанавливает указатель ======================================
			while (Count1 < Row) {
				Char = fgetc(FileIn);
				fputc(Char, FileOut);
				if (Char == '#') {
					for (Count = 0; Count < 6; Count++) {
						Temp[Count] = fgetc(FileIn);
						Temp[Count+1] = '\0';
					}
					fputs(Temp, FileOut);
					if (strcmp(Temp, "define") == 0) {
						Char = fgetc(FileIn);
						fputc(Char, FileOut);
						while (isspace(Char) != 0) {
						Char = fgetc(FileIn); 
						fputc(Char, FileOut);
						}
						while (isspace(Char) == 0) {
							Char = fgetc(FileIn);
							fputc(Char, FileOut);
						}
						while (isspace(Char) != 0) {
							Char = fgetc(FileIn); 
							fputc(Char, FileOut);
						}
						while (isspace(Char) == 0) {
							Char = fgetc(FileIn);
							fputc(Char, FileOut);
						}
						fgetpos(FileIn, &Pos);
						Count1++;
					} 
				}
			}
			rewind(FileIn);
			fsetpos(FileIn, &Pos);
// ================================= выводит тело с заменой ======================================================
			while (!feof(FileIn)) {
				Char = fgetc(FileIn);
				fgetpos(FileIn, &Pos);
				Trig = 0;
				for (Count = 0; Count < Row; Count++) {
					if (Char == Def1[Count][0]) {
						Col = strlen(Def1[Count]);
						Temp[0] = Char;
						Temp[Col] = '\0';
						if (Col > 1) {
							for (Count1 = 1; Count1 < Col; Count1++) {
								Temp[Count1] = fgetc(FileIn);
							}
						}
						if (!strcmp(Def1[Count], Temp)) {
							fputs(Def2[Count], FileOut);
							Trig++;
							break;
						} else fsetpos(FileIn, &Pos);
					}
				}
				if (Trig == 0 && Char != EOF) fputc(Char, FileOut);
			}
		}
// =================================================================================================================
		if (ErrIn == 0) {
			if (fclose(FileIn)) {
				printf("\n Ошибка при закрытии исходного файла.\n\n");
				if (ErrLog == 0) {
					LTime = time(NULL);
					fputs(ctime(&LTime), FileLog);
					fputs("Error closing input file.\n\n", FileLog);
				}
			} else {
				if (ErrLog == 0) {
					LTime = time(NULL);
					fputs(ctime(&LTime), FileLog);
					fputs("Сlosing input file successfully.\n\n", FileLog);
				}
			}
		}
		if (ErrOut == 0) {
			if (fclose(FileOut)) {
				printf("\n Ошибка при закрытии файла вывода.");
				if (ErrLog == 0) {
					LTime = time(NULL);
					fputs(ctime(&LTime), FileLog);
					fputs("Error closing output file.\n\n", FileLog);
				}
			} else {
				if (ErrLog == 0) {
					LTime = time(NULL);
					fputs(ctime(&LTime), FileLog);
					fputs("Сlosing output file successfully.\n\n", FileLog);
				}
			}
		}
	}
	return(0);
}
