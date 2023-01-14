#include <stdio.h>

#include <iostream>

int main()
{
 
     unsigned short A,B,C,D;//a = 'a';
    _asm {
        mov ax, 12
        add ax, 4
        sub ax, 7
        mov bx, 5
        mul bl
        mov B, ax

        mov ax, 17
        mov bx, 2
        div bl
        mov ah, 0
        mov D, ax

        mov ax, 36
        mov bx, 4
        mul bl  
        sub ax,D
        mov A,ax
      



        mov ax, B
        mov bx, A
        div bl
        mov ah, 0
        mov B, ax
        
        mov ax, 2
        add ax, 5
        mov bx, 7
        div bl
        mov ah,0
        mov bx,B
        mul bl
        add ax,14

        mov A,ax
    }
    printf("%d",A );
}
