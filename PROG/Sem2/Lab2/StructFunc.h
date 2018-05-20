typedef struct Auto {
	int index;
	char model[100];
	int year;
	int mile;
	int price;
	struct Auto *next;
} Auto;

Auto *GetNodeAddr(Auto *Start, int Num) { 
	Auto *Addr = Start;
	int Count;
	for (Count = 0; Count < Num; Count++) Addr = Addr->next;
	return(Addr);
}

void AddNode(Auto *Head, char *Model, int Year, int Mile, int Price) {
	Auto *New, *Prev;
	if ((New = (Auto *)malloc(sizeof(Auto))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	New->index = Head->index+1;
	strcpy(New->model, Model);
	New->year = Year;
	New->mile = Mile;
	New->price = Price;
	New->next = NULL;
	Prev = GetNodeAddr(Head, Head -> index);
	Prev->next = New;
	Head->index++;
}

void InsertNode(Auto *Head, Auto *Start, int Num, char *Model, int Year, int Mile, int Price) {
	Auto *New, *Prev;
	if ((New = (Auto *)malloc(sizeof(Auto))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	Prev = GetNodeAddr(Start, Num-1);
	New->index = Head->index+1;
	strcpy(New->model, Model);
	New->year = Year;
	New->mile = Mile;
	New->price = Price;
	New->next = Prev->next;
	Prev->next = New;
	Head->index++;
}

void DeleteNode(Auto *Head, Auto *Start, int Num) {
	Auto *Prev, *Node, *Next; int Count;
	Prev = GetNodeAddr(Start, Num-1);
	Node = GetNodeAddr(Start, Num);
	Next = GetNodeAddr(Start, Num+1);
	Prev->next = Node->next;
	for (Count = 0; Count < (Head->index - Node->index); Count++) {
		Next->index--;
		Next = Next->next;
	}
	free(Node);
	Head->index--;
}

void PrintNodeData(Auto *Start, int Num) {
	Auto *Node; 
	Node = GetNodeAddr(Start, Num);
	fprintf(stdout, "\nИндекс=%d ", Node->index);
	fprintf(stdout, "Модель=%s ", Node->model);
	fprintf(stdout, "Год=%d ", Node->year);
	fprintf(stdout, "Пробег=%d ", Node->mile);
	fprintf(stdout, "Цена=%d\n", Node->price);
}

Auto *CreateList(void) {
	Auto *Head;
	if ((Head = (Auto *)malloc(sizeof(Auto))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	Head->index = 0;
	Head->next = NULL;
	return(Head);
}

void PrintListData(Auto *Head) {
	Auto *Addr;
	int Count;
	for (Count = 1; Count <= Head->index; Count++) {
		Addr = GetNodeAddr(Head, Count);
		fprintf(stdout, "\nИндекс=%d ", Addr->index);
		fprintf(stdout, "Модель=%s ", Addr->model);
		fprintf(stdout, "Год=%d ", Addr->year);
		fprintf(stdout, "Пробег=%d ", Addr->mile);
		fprintf(stdout, "Цена=%d\n", Addr->price);
	}
}

void DeleteList(Auto *Head) {
	while (Head->index) DeleteNode(Head, Head, 1);
	free(Head);
}

int LengthList(Auto *Head) {
	return(Head->index);
}
