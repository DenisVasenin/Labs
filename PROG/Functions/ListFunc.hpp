#include <iostream>
#include <cstdlib>

using namespace std;

// ===================================== ОБЬЯВЛЕНИЕ СТРУКТУРЫ И КЛАССА ======================================


struct Element {
	int data;
	struct Element* next;
};


class List {
	protected:
		int data;
		Element* next;
		Element* createElement(void);
	public:
		Element* createList(void);
		Element* getElementAddress(Element* Start, int Num);
		void addElement(Element* Head, int Val);
		void insertElement(Element* Head, Element* Start, int Num, int Val);
		void deleteElement(Element* Head, Element* Start, int Num);
		void swapElements(Element* Start, int Num1, int Num2);
		int getElementData(Element* Start, int Num);
		void printListData(Element* Head);
		void deleteList(Element* Head);
		int lengthList(Element *Head);
		~List(void);
};


// ===================================== МЕТОДЫ И ФУНКЦИИ КЛАССА ============================================


/*
	Создать элемент.
	Возвращает указатель на новый элемент списка.
	В случае невозможности выделения памяти выводится ошибка и программа закрывается с кодом 1. 
	Пример:
		Element* New;                                     // создаем указатель на список
		New = createElement();                            // присваиваем указателю адрес головы списка
*/

Element* List::createElement(void) {
	Element* AddrNew;
	if ((AddrNew = new Element) == NULL) {
		cout << "Error allocating memory.\n";
		exit(1);
	}
	return(AddrNew);
}


/*
	Создать список.
	Возвращает указатель на первый элемент(голову) списка.
	В поле data головы содержится количество элементов списка. 
	Пример:
		Element* Head;                                    // создаем указатель на голову списка
		Head = createList();                              // присваиваем указателю адрес головы списка
*/

Element* List::createList(void) {
	Element* AddrHead;
	AddrHead = createElement();
	AddrHead->data = 0;
	AddrHead->next = NULL;
	return(AddrHead);
}


/*
	Получить адрес элемента списка.
	В качестве аргументов принимает указатель на элемент отсчета и номер элемента списка.
	Возвращает указатель на элемент если он найден. В противном случае выводится ошибка и программа закрывается с кодом 2.
	Пример:
		Element* Addr;                                    // создаем указатель
		Addr = getElementAddress(Head, 5);                // присваивам указателю адрес пятого элемента с начала списка
*/

Element* List::getElementAddress(Element* Start, int Num) { 
	Element* Addr = Start;
	int Count;
	for (Count = 0; Count < Num; Count++) Addr = Addr->next;
	if (Addr == NULL) {
		cout << "Error. Element not found.\n";
		exit(2);
	}
	return(Addr);
}


/*
	Добавить элемент в конец списка.
	В качестве аргументов принимает указатель на голову списка и значение данных нового элемента списка.
	Пример:
		addElement(Head, 1);                              // добавляет в конец списка новый элемент с единицей в поле данных
*/

void List::addElement(Element* Head, int Val) {
	Element* AddrNew;
	Element* AddrPrev;
	AddrNew = createElement();
	AddrNew->data = Val;
	AddrNew->next = NULL;
	AddrPrev = getElementAddress(Head, Head->data);
	AddrPrev->next = AddrNew;
	Head->data++;
}


/*
	Добавить элемент в указанную позицию списка.
	В качестве аргументов принимает указатели на голову списка и элемент отсчета, а также номер нового элемента списка и значение данных нового элемента списка.
	Указатель Head нужен для увеличения счетчика элементов в голове списка.
	Элементы перед новым элементом должны уже существовать.
	Пример:
		Element* Start;                                   // создаем указатель на элемент отсчета
		Start = getElementAddress(Head, 3);               // присваивам указателю адрес третьего элемента с начала списка
		insertElement(Head, Start, 4, 56);                // добавляем новый элемент списка в позицию 3+4 c начала списка (элементы с 1 по 6 уже должны существовать)
		
		insertElement(Head, Head, 2, 56);                 // добавляем новый элемент списка в позицию 2 c начала списка (элемент 1 уже должен существовать)
*/

void List::insertElement(Element* Head, Element* Start, int Num, int Val) {
	Element* AddrNew;
	Element* AddrPrev;
	AddrNew = createElement();
	AddrPrev = getElementAddress(Start, Num-1);
	AddrNew->data = Val;
	AddrNew->next = AddrPrev->next;
	AddrPrev->next = AddrNew;
	Head->data++;
}


/*
	Удалить элемент списка.
	В качестве аргументов принимает указатели на голову списка и элемент отсчета, а также номер удаляемого элемента списка.
	Указатель Head нужен для уменьшения счетчика элементов в голове списка.
	Удаляемый элемент должен существовать.
	Пример:
		Element* Start;                                   // создаем указатель на элемент отсчета
		Start = getElementAddress(Head, 8);               // присваивам указателю адрес восьмого элемента с начала списка
		deleteElement(Head, Start, 2);                    // удаляем элемент списка в позиции 8+2 c начала списка (элемент 10 уже должен существовать)
		
		deleteElement(Head, Head, 5);                     // удаляем элемент списка в позиции 5 c начала списка (элемент 5 уже должен существовать)
*/

void List::deleteElement(Element* Head, Element* Start, int Num) {
	Element* AddrDel;
	Element* AddrPrev;
	AddrPrev = getElementAddress(Start, Num-1);
	AddrDel = getElementAddress(Start, Num);
	AddrPrev->next = AddrDel->next;
	free(AddrDel);
	Head->data--;
}


/*
	Поменять элементы местами.
	В качестве аргументов принимает указатель на элемент отсчета и номера меняемых элементов списка.
	Пример:
		Element* Start;                                   // создаем указатель на элемент отсчета
		Start = getElementAddress(Head, 2);               // присваивам указателю адрес второго элемента с начала списка
		swapElements(Start, 4, 6);                        // меняем местами 2+4 и 2+6 элементы с начала списка
		
		swapElements(Head, 3, 7);                         // меняем местами 3 и 7 элементы с начала списка
*/

void List::swapElements(Element* Start, int Num1, int Num2) {
	Element* Addr1; 
	Element* Addr2;
	Element* Addr3;
	Element* Addr4;
	Element* Temp;
	Addr1 = getElementAddress(Start, Num1 - 1);
	Addr2 = getElementAddress(Start, Num1);
	Addr3 = getElementAddress(Start, Num2 - 1);
	Addr4 = getElementAddress(Start, Num2);
	Temp = Addr1->next;
	Addr1->next = Addr3->next;
	Addr3->next = Temp;
	Temp = Addr2->next;
	Addr2->next = Addr4->next;
	Addr4->next = Temp;
}


/*
	Получить данные из элемента списка.
	В качестве аргументов принимает указатель на элемент отсчета и номер элемента списка.
	Возвращает данные элемента списка.
	Пример:
		int Data;                                         // создаем переменную для данных
		Element* Start;                                   // создаем указатель на элемент отсчета
		Start = getElementAddress(Head, 9);               // присваивам указателю адрес девятого элемента с начала списка
		Data = getElementData(Start, 2);                  // получаем данные 9+2 элемента с начала списка
		
		Data = getElementData(Head, 2);                   // получаем данные 2 элемента с начала списка
*/

int List::getElementData(Element* Start, int Num) {
	Element* Addr; 
	Addr = getElementAddress(Start, Num);
	return(Addr->data);
}


/*
	Вывести данные списка на печать.
	В качестве аргумента принимает указатель на голову списка.
	Пример:
		printListData(Head);
*/

void List::printListData(Element* Head) {
	Element* Addr;
	int Count;
	cout << Head->next << " => ";
	for (Count = 1; Count <= Head->data; Count++) {
		Addr = getElementAddress(Head, Count);
		cout << Addr->data << " ";
		cout << Addr->next << " => ";
	}
	cout << "\n";
}


/*
	Удалить список.
	В качестве аргумента принимает указатель на голову удаляемого списка.
	Пример:
		deleteList(Head);
*/

void List::deleteList(Element* Head) {
	while (Head->data) deleteElement(Head, Head, 1);
	free(Head);
}


/*
	Узнать количество элементов в списке.
	В качестве аргумента принимает указатель на голову списка.
	Возвращает количество элементов списка.
	Пример:
		int Count;
		Count = lengthList(Head);
*/

int List::lengthList(Element* Head) {
	return(Head->data);
}

List::~List(void) {

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////

void Logo() {
	cout << "\n" << "                                 ============================\n" << "\n";
	cout << "                                   XX  XX  YY  YY  NN    NN  \n";
	cout << "                                    XXXX    YYYY   NNNN  NN  \n";
	cout << "                                     XX      YY    NN NN NN  \n";
	cout << "                                    XXXX     YY    NN  NNNN  \n";
	cout << "                                   XX  XX    YY    NN    NN  \n";
	cout << "\n" << "\n";
	cout << "                                  Пенкин Станислав гр ИВТ-21 \n";
	cout << "\n" << "                                 ============================\n";
	cout << "\n";
	cout << "==========================================================================================================\n";
	cout << "                     В списке целых целых чисел поменять местами N первых и N последних элементов\n";
	cout << "==========================================================================================================\n";
	cout << "\n";
	cout << "==========================================================================================================\n";
	cout << "      Все настройки программы находятся в файле config, который находится в корневой папке программы.\n";
	cout << "==========================================================================================================\n";
	cout << "\n";
}