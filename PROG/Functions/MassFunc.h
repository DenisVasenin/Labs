//Вывод одномерного массива
void PrintArray(int Array[], int Size)
{ 
	int i;
	for (i = 0; i < Size; i++) 
		printf("%d ", Array[i]);
}

//Сортировка одномерного массива
void SortArray1D(int n, int * A)
{
for (int i=0; i<n; i++)
    {
	int Min=i;
	for (int j=i+1;j<n;j++)
		if (A[j]<A[Min])
			Min=j;
	int C=A[i];
	A[i]=A[Min];
	A[Min]=C;
    }
}

//Перевод одномерного массива в двумерный
void Array1Dto2D(int M,int N,int A[M*N],int B[M][N])
{
	int k=0;
	for (int i=0; i<M; i++) 
		for (int j=0; j<N; j++) 
		{
			B[i][j]=A[k];
			k++;
		}
}

//Ввод двумерного массива в ручном режиме
void GetArray2DHand(int M, int N, int B[M][N])
{
	char buffer[20];
	printf("Выбран ручной способ ввода. Размер массива: %d x %d\n",M,N);
	for (int i=0; i<M; i++) 
		for (int j=0; j<N; j++) 
		{
			printf("Введите элемент %d, %d", i,j);
			printf(" ===> ");
			fgets(buffer,7,stdin);
			B[i][j]=atoi(buffer);
		}
}

//Ввод двумерного массива в автоматическом (случайно) режиме
void GetArray2DRand(int Rows, int Columns,int Array[Rows][Columns])
{
	int CountR,CountC;
	printf("Выбран автоматический способ ввода. Размер массива: %d x %d\n",Rows,Columns);
	srand(time(NULL));
	for (CountR=0;CountR<Rows;CountR++)
		for (CountC=0;CountC<Columns;CountC++)
			Array[CountR][CountC]=rand()%100;
}

//Вывод двумерного массива
void PrintArray2D(int M,int N,int B[M][N])
{
	for (int i = 0; i < M; i++) 
	{
		for (int j = 0; j < N; j++)
			printf("%4d  ", B[i][j]); 
		puts("\n");
	}
}

//Перевод двумерного массива в одномерный
void Array2DTo1D(int M,int N,int B[M][N],int A[M*N])
{
	int k=0;
	for (int i=0; i<M; i++) 
		for (int j=0; j<N; j++) 
		{
			A[k]=B[i][j];
			k++;
		}
}
