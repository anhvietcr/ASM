#include <iostream>
#define N 32    //do dai toi da cua bit
#define K 1     //so bit can dich

int* getNBit(int);
int* andBit(int*, int*);
int* orBit(int*, int*);
int* xorBit(int*, int*);
int* notBit(int*);
int* shiftLeftKBit(int);
int* shiftRightKBit(int);



void printNBit(int*);

int main()
{
    int a, b;
    int *a32, *b32;
    std::cout << "Nhap a = "; std::cin >> a;
    std::cout << "Nhap b = "; std::cin >> b;

    //luu vao 2 day 32 bit
    a32 = getNBit(a);
    b32 = getNBit(b);

    //day 32 bit
    std::cout << "Day 32 bit cua a va b la: \n";
    printNBit(a32);
    printNBit(b32);

    //and - or - xor - not;
    std::cout << "a & b = "; printNBit(andBit(a32, b32));
    std::cout << "a | b = "; printNBit(orBit(a32, b32));
    std::cout << "a ^ b = "; printNBit(xorBit(a32, b32));
    std::cout << "!a = "; printNBit(notBit(a32));
    std::cout << "!b = "; printNBit(notBit(b32));

    //dich trai dich phai
    std::cout << "a dich phai " << K << " bit = "; printNBit(shiftRightKBit(a));
    std::cout << "a dich trai " << K << " bit = "; printNBit(shiftLeftKBit(a));
    std::cout << "b dich phai " << K << " bit = "; printNBit(shiftRightKBit(b));
    std::cout << "b dich trai " << K << " bit = "; printNBit(shiftLeftKBit(b));

}

void printNBit(int arr[])
{
    for(int i = 0; i < 32; i++)
    {
        std::cout << arr[i];
    }
    std::cout << "\n";
}

int* getNBit(int x)
{
    int* arr = new int[32];
    for(int i = 31; i >=0; i--)
    {
        //cong thuc get bit thu i; day~ bit >> (N-i-1) &1
        arr[i] = (x >> (N-i-1)) & 1;
    }
    return arr;
}

int* andBit(int a32[], int b32[])
{
    int *arr = new int[32];
    for(int i = 31; i >= 0; i--)
    {
        arr[i] = a32[i] && b32[i];
    }
    return arr;
}
int* orBit(int a32[], int b32[])
{
    int *arr = new int[32];
    for(int i = 31; i >= 0; i--)
    {
        arr[i] = a32[i] | b32[i];
    }
    return arr;
}
int* xorBit(int a32[], int b32[])
{
    int *arr = new int[32];
    for(int i = 31; i >= 0; i--)
    {
        arr[i] = a32[i] ^ b32[i];
    }
    return arr;
}
int* notBit(int x32[])
{
    int *arr = new int[32];
    for(int i = 31; i >= 0; i--)
    {
        arr[i] = !x32[i];
    }
    return arr;
}

int* shiftLeftKBit(int x)
{
    int* arr = new int[32];
    //dich trai k bit
    int shift = (x << K);

    //chuyen sang nhi phan N bit
    arr = getNBit(shift);

    //tra ve ket qua
    return arr;
}
int* shiftRightKBit(int x)
{
    int* arr = new int[32];
    //dich phai K bit
    int shift = (x >> K);

    //chuyen sang nhi phan N bit
    arr = getNBit(shift);

    //tra ve ket qua
    return arr;
}
