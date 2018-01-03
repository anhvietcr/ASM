#include <iostream>

#define BIT 32

void print_2(bool*);
bool* _10_to_2(int);
int _2_to_10(bool*);
bool* addition(bool*, bool*);
bool* bu1(bool*);
bool* bu2(bool*);
bool* subtraction(bool*, bool*);

int main()
{
	bool *a;
	bool *b;
	int n;

	std::cout << "Nhap n1 = "; std::cin >> n;
	a = _10_to_2(n);

	std::cout << "Nhap n2 = "; std::cin >> n;
	b = _10_to_2(n);

	
	std::cout << "+ Cong 2 day bit: (he 2) = "; print_2(addition(a, b));
	std::cout << "+ Cong 2 day bit: (he 10) = " << _2_to_10(addition(a, b));
	std::cout << "\n";
	std::cout << "+ Tru 2 day bit: (he 2) = "; print_2(subtraction(a, b));
	std::cout << "+ Tru 2 day bit: (he 10) = " << _2_to_10(subtraction(a, b));
	std::cout << "\n";



	system("pause");
	return 1;
}

void print_2(bool* t)
{
	//in day n BIT sang nhi phan
	for (int i = 0; i < BIT; i++)
	{
		std::cout << t[i];
	}
	std::cout << "\n";
}

bool* _10_to_2(int n)
{
	//chuyen so he 10 -> he 2
	bool* t = new bool[BIT];
	
	for (int i = BIT - 1; i >= 0; i--)
	{
		t[i] = ((n >> (BIT - i - 1)) & 1);
	}
	return t;
}

int _2_to_10(bool* t)
{
	//chuyen so he 2 -> he 10
	int  n = 0;
	for (int i = BIT - 1; i >= 0; i--)
	{
		n = (t[i] << (BIT - i - 1)) | n;
	}
	return n;
}

bool* addition(bool* a, bool* b)
{
	//cong 2 day bit 
	bool* sum = new bool[BIT];
	int save = 0;
	int i = BIT - 1;
	while (i >= 0)
	{
		sum[i] = (a[i] + b[i] + save) % 2;
		save = (a[i] + b[i] + save) / 2;
		i--;
	}
	return sum;
}

bool* subtraction(bool* a, bool* b)
{
	//a - b = a + (-b) <=> a + (bu2(-b))
	// bu2 = bu1 + 1
	//bu1 = dao bit neu so am (chac chan la so am vi thuc hien phep tru)
	bool* sub = new bool[BIT];
	sub = addition(a, bu2(b));
	return sub;
}
bool* bu2(bool* t)
{
	bool* kq = new bool[BIT];
	kq = addition(bu1(t), _10_to_2(1));
	return kq;
}
bool* bu1(bool* t)
{
	bool* kq = new bool[BIT];
	for (int i = 0; i < BIT; i++)
	{
		kq[i] = !t[i];
	}
	return kq;
}