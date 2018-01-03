#include <iostream>

#define BIT 32

void printNhiPhan(bool*);
bool* chuyenThapSangNhi(int);
int chuyenNhiSangThap(bool*);

bool* getS(int);
bool* getE(int);
bool* getM(int);
void printS(bool*);
void printE(bool*);
void printM(bool*);

float binary_to_float(bool*);


int main()
{
	//cau 1
	std::cout << "\n\nCau 1: \n";
	float x = 0;
	std::cout << "\n+ Nhap x = ";
	std::cin >> x;
	int *p = (int*)&x;

	std::cout << "+ Float -> binary: ";
	//printNhiPhan(chuyenThapSangNhi(*p));
	printS(getS(*p));
	printE(getE(*p));
	printM(getM(*p));
	std::cout << "\n";


	//cau 2
	std::cout << "\n\nCau 2: \n";
	std::cout << "\n+ Binary -> float: ";
	printNhiPhan(chuyenThapSangNhi(*p));
	std::cout << " = " << binary_to_float(chuyenThapSangNhi(*p)) << "\n";

	std::cout << "+ Binary -> float: ";
	bool s[32] = {0,0,1,1,1,1,0,1,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1}; //0.1
	std::cout << "0 01111011 10011001100110011001101 = " << binary_to_float(s) << "\n";

	//cau 3
	std::cout << "\n\nCau 3: \n";
	float f = 1.3E+20;
	int *q = (int*)&f;
	std::cout << "\n+ 1.3E+20 -> binary: ";
	printNhiPhan(chuyenThapSangNhi(*q));
	std::cout << "\n";

	float so_Float_nho_hon_0 = 0;
	char *conv = (char*)&so_Float_nho_hon_0;
	(*conv) |= 1;
	std::cout << "+ So float nho hon so 0 la so : " << so_Float_nho_hon_0 << std::endl;
	std::cout << "+ Bieu dien nhi phan : "; printNhiPhan(chuyenThapSangNhi(*conv));

	std::cout << "\n+ Truong hop dac biet: \n";
	bool db1[32] = { 0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }; //NaN
	bool db2[32] = { 0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }; //inf
	std::cout << "0 11111111 10000000000000000000000 = " << binary_to_float(db1);
	std::cout << "\n" << "0 11111111 00000000000000000000000 = " << binary_to_float(db2);


	//cau 4
	std::cout << "\n\nCau 4: \n";
	int iNumber = 10;
	float fNumber = 10.5;
	std::cout << "(int)" << iNumber << "-> (float)" << (float)iNumber << "-> (int)" << iNumber << "\n";
	std::cout << "(float)" << fNumber << "-> (int)" << (int)fNumber << "-> (float)" << fNumber << "\n";

	system("pause");
	return 1;
}

void printNhiPhan(bool* s)
{
	for (int i = 0; i < BIT; i++)
	{
		std::cout << s[i];
	}
	//std::cout << std::endl;
}

bool* chuyenThapSangNhi(int n)
{
	bool* s = new bool[BIT];
	for (int i = BIT - 1; i > -1; i--)
	{
		s[i] = (n >> (BIT - i - 1)) & 1;
	}
	return s;
}

int chuyenNhiSangThap(bool* s)
{
	int n = 0;
	for (int i = BIT - 1; i > -1; i--)
	{
		n = n | (s[i] << (BIT - i - 1));
	}
	return n;
}

bool* getS(int x)
{
	//get 1 bit S: 31
	bool* s = new bool[1];

	s[0] = (x >> (31)) & 1;

	return s;
}
bool* getE(int x)
{
	//get 8 bit E: 23 -> 30
	bool* s = new bool[8];
	for (int i = 8 - 1; i > -1; i--)
	{
		s[i] = (x >> (31 - i - 1)) & 1;
	}
	return s;
}
bool* getM(int x)
{
	//get 23 bit M : 0 -> 22
	bool* s = new bool[23];
	for (int i = 23 - 1; i > -1; i--)
	{
		s[i] = (x >> (23 - i - 1)) & 1;
	}
	return s;
}

void printS(bool* s)
{
	//in ra bit 0
	int bit = 1;
	for (int i = 0; i < bit; i++)
	{
		std::cout << s[i];
	}
	std::cout << " ";
}
void printE(bool* s)
{
	//in ra bit : 1-> 8
	int bit = 8;
	for (int i = 0; i < bit; i++)
	{
		std::cout << s[i];
	}
	std::cout << " ";
}
void printM(bool* s)
{
	//in ra bit 9 -> 31
	int bit = 23;
	for (int i = 0; i < bit; i++)
	{
		std::cout << s[i];
	}
	std::cout << " ";
}

float binary_to_float(bool* s)
{
	//chuyen day nhi phan sang kieu cham dong FLOAT
	int x = 0;
	for (int i = 0; i < 32; i++)
	{
		x = x | (s[i] << (BIT - i - 1));
	}
	return *(float*)&x;
}