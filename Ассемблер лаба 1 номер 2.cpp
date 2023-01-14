

#include <iostream>
#include <stdio.h>
using namespace std;
int main()
{
    short A, B, C;
    _asm
    {
        mov ax, 00001010b //10
        mov bx, 00011110b //30
        mov cx, 00101111b //47
        mov dx, 11110000b// маска дл умножение bx и ax
        shl cx,4  //cx=1111000
        or ax, cx   //лог сложение страшей части первого с младшей частью третьего//ax=11111010
        or bx,dx // разделение младшей bx = 11111110
        and ax,bx //лог умножение младших частей первого и второго чисел// ax=11111010(250)

       shr ax,2 //деление на 4 //ax=62dec
   
        mov A, ax


        
    }
    cout << A;

}