
#include <iostream>
#include <stdio.h>

int main()
{
	short y, y1, y2, x, a,Y1,Y2;
	
	std::cout << "a is "; std::cin >>a;
	std::cout << "x is "; std::cin >> x;
	_asm
	{
		mov cx, 1;
		mov ax, a
		mov bx, x
		cmp ax, bx
		je Ravn

			Neravn:
		mov cx, ax
			sub cx, bx
			jmp label_1;
		Ravn:
		mov cx, bx
			add cx, 3

			label_1 :
			mov y1, cx;




			label_3:
	cmp ax,bx
			jl Men

			mov cx,ax
			sub cx,bx
			jmp label_2
		
			Men :
		mov cx,ax
			label_2:
		mov y2,cx




	}
	y = y1 * y2;
	printf("%d\n", y1);
	printf("%d\n", y2);
	printf("%d\n", y);
	return 0;
}