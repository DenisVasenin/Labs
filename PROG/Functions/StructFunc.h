/*
#include <malloc.h>
*/


/*
 Определение типа.
*/

typedef struct List {
	int data;
	struct List *next;
} List;


/*
 Получить адрес элемента списка.
 В качестве аргументов принимает указатель на элемент отсчета и номер элемента списка.
 Возвращает указатель на элемент если он найден.
 Пример:
		List *Addr;
		Addr = GetNodeAddr(Start, 5);
*/

List *GetNodeAddr(List *Start, int Num) { 
	List *Addr = Start;
	int Count;
	for (Count = 0; Count < Num; Count++) Addr = Addr->next;
	return(Addr);
}


/*
 Добавить элемент в конец списка.
 В качестве аргументов принимает указатель на голову списка и значение данных нового элемента списка.
 Пример:
		AddNode(Head, 1);
*/

void AddNode(List *Head, int Val) {
	List *New, *Prev;
	if ((New = (List *)malloc(sizeof(List))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	New->data = Val;
	New->next = NULL;
	Prev = GetNodeAddr(Head, Head->data);
	Prev->next = New;
	Head->data++;
}


/*
 Добавить элемент в указанную позицию списка.
 В качестве аргументов принимает указатели на голову списка и элемент отсчета, а также номер нового элемента списка и значение данных нового элемента списка.
 Пример:
		InsertNode(Head, Start, 2, 56);
*/

void InsertNode(List *Head, List *Start, int Num, int Val) {
	List *New, *Prev;
	if ((New = (List *)malloc(sizeof(List))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	Prev = GetNodeAddr(Start, Num-1);
	New->data = Val;
	New->next = Prev->next;
	Prev->next = New;
	Head->data++;
}


/*
 Удалить элемент списка.
 В качестве аргументов принимает указатели на голову списка и элемент отсчета, а также номер удаляемого элемента списка.
 Пример:
		DeleteNode(Head, Start, 2);
*/

void DeleteNode(List *Head, List *Start, int Num) {
	List *Prev, *Node;
	Prev = GetNodeAddr(Start, Num-1);
	Node = GetNodeAddr(Start, Num);
	Prev->next = Node->next;
	free(Node);
	Head->data--;
}


/*
 Поменять элементы местами.
 В качестве аргументов принимает указатель на элемент отсчета и номера меняемых элементов списка.
 Пример:
		SwapNodes(Start, 2, 5);
*/

void SwapNodes(List *Start, int Num1, int Num2) {
	List *Node1, *Node2;
	int TempData;
	Node1 = GetNodeAddr(Start, Num1);
	Node2 = GetNodeAddr(Start, Num2);
	TempData = Node1->data;
	Node1->data = Node2->data;
	Node2->data = TempData;
}


/*
 Получить данные из элемента списка.
 В качестве аргументов принимает указатель на элемент отсчета и номер элемента списка.
 Возвращает данные элемента списка.
 Пример:
		int Data;
		Data = GetNodeData(Start, 2);
*/

int GetNodeData(List *Start, int Num) {
	List *Node; 
	Node = GetNodeAddr(Start, Num);
	return(Node->data);
}


/*
 Создать новый список.
 Возвращает указатель на первый элемент(голову) списка.
 Пример:
		List *Head;
		Head = CreateList();
*/

List *CreateList(void) {
	List *Head;
	if ((Head = (List *)malloc(sizeof(List))) == NULL) {
		fprintf(stderr, "Error allocating memory.\n");
		exit(0);
	}
	Head->data = 0;
	Head->next = NULL;
	return(Head);
}


/*
 Вывести данные списка на печать.
 В качестве аргумента принимает указатель на голову списка.
 Пример:
		PrintListData(Head);
*/

void PrintListData(List *Head) {
	List *Addr;
	int Count;
	for (Count = 1; Count <= Head->data; Count++) {
		Addr = GetNodeAddr(Head, Count);
		fprintf(stdout, "%d ", Addr->data);
	}
}


/*
 Удалить список.
 В качестве аргумента принимает указатель на голову удаляемого списка.
 Пример:
		DeleteList(Head);
*/

void DeleteList(List *Head) {
	while (Head->data) DeleteNode(Head, Head, 1);
	free(Head);
}


/*
 Узнать количество элементов в списке.
 В качестве аргумента принимает указатель на голову списка.
 Возвращает количество элементов списка.
 Пример:
		int Count;
		Count = GetCountNodes(Head);
*/

int LengthList(List *Head) {
	return(Head->data);
}
