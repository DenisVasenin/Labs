#define true 1

void Hint(void) {
	fprintf(stdout, "\nНеизвестная команда. Введите help для чтения справки по командам.");
}

void Help(void) {
	fprintf(stdout, "\nВ программе используются следующие команды для баз:\n");
	fprintf(stdout, "createbase - создать базу.\n");
	fprintf(stdout, "seekbase - искать файлы баз.\n");
	fprintf(stdout, "openbase - открыть базу.\n");
	fprintf(stdout, "printbase - вывести базу на экран.\n");
	fprintf(stdout, "lenbase - узнать количество записей в базе.\n");
	fprintf(stdout, "closebase - закрыть текущую базу.\n");
	fprintf(stdout, "deletebase - удалить базу.\n\n");
	fprintf(stdout, "В программе используются следующие команды для записей:\n");
	fprintf(stdout, "addrecord - добавить запись в базу.\n");
	fprintf(stdout, "searchrecord - найти запись в базе.\n");
	fprintf(stdout, "printrecord - вывести запись на экран.\n");
	fprintf(stdout, "deleterecord - удалить запись.\n\n");
	fprintf(stdout, "Прочие команды:\n");
	fprintf(stdout, "help - помощь.\n");
	fprintf(stdout, "exit - выйти из программы.");
}

void Exit(void) {
	system("clear");
	exit(0);
}

void CreateBase(char *Sig, FILE *Log) {
	char BaseName[100]; FILE *Base; Auto *Head;
/////////////////////////////////////////////////////////////////////////////////
	fprintf(stdout, "\nВведите название файла создаваемой базы: ");
	GetString(BaseName, 50);
	if (!(CreateFile(BaseName, Log))) {
		fprintf(stdout, "\nОшибка создания файла базы.\nДля подробностей смотрите лог.");
	} else {
		Head = CreateList();
		OpenFile(BaseName, &Base, Log);
		WriteSign(Sig, Base, Log);
		fwrite(Head, sizeof(Auto), 1, Base);
		DeleteList(Head);
		CloseFile(BaseName, &Base, Log);
		fprintf(stdout, "\nФайл базы успешно создан.");
	}
}

void SeekBase(char *Sig, FILE *Log) {
	char FileName[100], FileTemp[] = "temp"; 
	FILE *Tmp, *File; int State = 0;
////////////////////////////////////////////////////////////////////
	system("ls -1 > temp");
	if (OpenFile(FileTemp, &Tmp, Log)) {
		fprintf(stdout, "\nНайденные базы: ");
		while (!feof(Tmp)) {
			fgets(FileName, 50, Tmp);
			FileName[strlen(FileName)-1] = '\0';
			if (OpenFile(FileName, &File, Log)) {
				if (CheckSign(Sig, File, Log)) {
					fprintf(stdout, "%s ", FileName);
					State++;
				}
				CloseFile(FileName, &File, Log);
			}
			memset(FileName, '\0', 1);
		}
		if (!State) fprintf(stdout, "баз не найдено.");
		CloseFile(FileTemp, &Tmp, Log);
		DeleteFile(FileTemp, Log);
	}
}

int OpenBase(char *CurrBase, FILE **CBase, Auto **Head, char *Sig, FILE *Log) {
	Auto *Node = NULL, *NextN = NULL, *TmpHead = NULL;
	int Count;
	char TempName[100]; FILE *TmpFile;
///////////////////////////////////////////////////////////////////////////////////////////
	fprintf(stdout, "\nВведите название файла открываемой базы: ");
	GetString(TempName, 50);
	if (!(OpenFile(TempName, &TmpFile, Log))) {
		fprintf(stdout, "\nОшибка при открытии файла базы.\nДля подробностей смотрите лог.");
	} else {
		if (!(CheckSign(Sig, TmpFile, Log))) {
			fprintf(stdout, "\nОшибка при открытии файла базы.\nДля подробностей смотрите лог.");
		} else {
			fseek(TmpFile, 7, SEEK_SET);
			TmpHead = (Auto *)malloc(sizeof(Auto));
			fread(TmpHead, sizeof(Auto), 1, TmpFile);
			TmpHead->next = NULL;
			if (TmpHead->index) {
				Node = (Auto *)malloc(sizeof(Auto));
				fread(Node, (sizeof(Auto)), 1, TmpFile);
				TmpHead->next = Node;
				Node->next = NULL;
				for (Count = 0; Count < TmpHead->index; Count++) {
					NextN = (Auto *)malloc(sizeof(Auto));
					fread(NextN, (sizeof(Auto)), 1, TmpFile);
					Node->next = NextN;
					NextN->next = NULL;
					Node = NextN;
				}
			}
			strcpy(CurrBase, TempName);
			*CBase = TmpFile; 
			*Head = TmpHead;
			fprintf(stdout, "\nБаза успешно открыта.\n");
			fprintf(stdout, "Количество записей в базе - %d.", TmpHead->index);
			return(1);
		}
	}
	return(0);
}

int CloseBase(char *CurrBase, FILE *CBase, Auto *Head, char *Sig, FILE *Log) {
	Auto *Node = Head; int Count;
//////////////////////////////////////////////////////////////////////////////////////////////
	CloseFile(CurrBase, &CBase, Log);
	DeleteFile(CurrBase, Log);
	CreateFile(CurrBase, Log);
	OpenFile(CurrBase, &CBase, Log);
	WriteSign(Sig, CBase, Log);
	fseek(CBase, 7, SEEK_SET);
	for (Count = 0; Count <= Head->index; Count++) {
		fwrite(Node, sizeof(Auto), 1, CBase);
		Node = Node->next;
	}
	DeleteList(Head);
	if (CloseFile(CurrBase, &CBase, Log)) {
		fprintf(stdout, "\nФайл базы успешно закрыт.");
		return(0);
	}
	else {
		fprintf(stdout, "\nОшибка при закрытии файла базы.\nДля подробностей смотрите лог.");
		return(1);
	}
}

void PrintBase(Auto *Head) {
	PrintListData(Head);
}

void LengthBase(Auto *Head) {
	fprintf(stdout, "\nКоличество записей в базе - %d.", Head->index);
}

void DeleteBase(char *Sig, FILE *Log) {
	char TempName[100]; FILE *TmpFile;
///////////////////////////////////////////////////////////////////////////////////////////
	fprintf(stdout, "\nВведите название файла удаляемой базы: ");
	GetString(TempName, 50);
	if (!(OpenFile(TempName, &TmpFile, Log))) {
		fprintf(stdout, "\nНеизвестная ошибка.\nПроверьте название файла.");
	} else {
		if (!(CheckSign(Sig, TmpFile, Log))) {
			fprintf(stdout, "\nУказаный файл не является файлом базы.");
		} else {
			if (DeleteFile(TempName, Log)) fprintf(stdout, "\nФайл базы успешно удален.");
			else fprintf(stdout, "\nОшибка при удалении файла базы.\nДля подробностей смотрите лог.");
		}
	}
}

void AddRecord(Auto *Head) {
	char Temp[100];
	char Model[50]; int Year = 0, Mile = 0, Price = 0;
////////////////////////////////////////////////////////////////////////////////////////////
	fprintf(stdout, "\nВведите модель автомобиля: ");
	GetString(Model, 50);
	while (true) { 
		fprintf(stdout, "Введите год выпуска автомобиля: ");
		GetString(Temp, 10);
		if (IsIntPos(Temp)) {
			Year = atoi(Temp);
			break;
		} else fprintf(stdout, "Не верный формат. Введите год еще раз.\n");
	}
	while (true) { 
		fprintf(stdout, "Введите пробег автомобиля: ");
		GetString(Temp, 10);
		if (IsIntPos(Temp)) {
			Mile = atoi(Temp);
			break;
		} else fprintf(stdout, "Не верный формат. Введите пробег еще раз.\n");
	}
	while (true) { 
		fprintf(stdout, "Введите цену автомобиля: ");
		GetString(Temp, 10);
		if (IsIntPos(Temp)) {
			Price = atoi(Temp);
			break;
		} else fprintf(stdout, "Не верный формат. Введите цену еще раз.\n");
	}
	AddNode(Head, Model, Year, Mile, Price);
	fprintf(stdout, "\nЗапись успешно добавлена.");
}

void SearchRecord(Auto *Head) {
	char KeyWord[100]; Auto *Node; 
	int State = 0, Count, KeyInt;
/////////////////////////////////////////////////////////////////////////////////////
	fprintf(stdout, "\nВведите ключевое слово: ");
	GetString(KeyWord, 50);
	fprintf(stdout, "\nНайденные вхождения: ");
	for (Count = 1; Count <= Head->index; Count++) {
		Node = GetNodeAddr(Head, Count);
		if (!(strcmp(Node->model, KeyWord))) {
			State = 1;
			PrintNodeData(Head, Count);
			continue;
		}
		if (IsIntPos(KeyWord)) {
			KeyInt = atoi(KeyWord);
			if (Node->year == KeyInt) {
				State = 1;
				PrintNodeData(Head, Count);
				continue;
			}
			if (Node->mile == KeyInt) {
				State = 1;
				PrintNodeData(Head, Count);
				continue;
			}
			if (Node->price == KeyInt) {
				State = 1;
				PrintNodeData(Head, Count);
				continue;
			}
		}
	}
	if (!State) fprintf(stdout, "вхождений не обнаружено.");
}

void PrintRecord(Auto *Head) {
	char Temp[100]; int Num;
/////////////////////////////////////////////////////////////////////////////////////
	while (true) { 
		fprintf(stdout, "\nВведите индекс записи: ");
		GetString(Temp, 5);
		if (IsIntPos(Temp)) {
			Num = atoi(Temp);
			break;
		} else fprintf(stdout, "Не верный формат. Введите индекс еще раз.\n");
	}
	if ((Num > Head->index) || (Num < 1)) fprintf(stdout, "Элемента с таким индексом нет в списке.\n");
	else PrintNodeData(Head, Num);
}

void DeleteRecord(Auto *Head) {
	char Temp[100]; int Num;
////////////////////////////////////////////////////////////////////////////////////////
	while (true) { 
		fprintf(stdout, "\nВведите индекс записи: ");
		GetString(Temp, 5);
		if (IsIntPos(Temp)) {
			Num = atoi(Temp);
			break;
		} else fprintf(stdout, "Не верный формат. Введите индекс еще раз.\n");
	}
	if ((Num > Head->index) || (Num < 1)) fprintf(stdout, "\nЭлемента с таким индексом нет в списке.");
	else {
		DeleteNode(Head, Head, Num);
		fprintf(stdout, "\nЗапись успешно удалена.");
	}
}
