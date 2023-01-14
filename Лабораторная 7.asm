.386
.MODEL flat, stdcall
includelib kernel32.lib

STD_INPUT_HANDLE EQU -10
STD_OUTPUT_HANDLE EQU -11
ReadConsole EQU<ReadConsoleA>
WriteConsole EQU <WriteConsoleA>
WriteConsoleOutputCharacter EQU <WriteConsoleOutputCharacterA>
COORD struct
x word ?
y word ?
COORD ends



BufSize = 100


GetStdHandle PROTO, nStdHandle:DWORD

ExitProcess PROTO :DWORD

ReadConsole PROTO,
handle: DWORD,
pBuffer: PTR BYTE,
maxBytes: DWORD,
pBytesRead: PTR DWORD,
notUsed: DWORD

WriteConsole PROTO,
handle: DWORD,
pBuffer: PTR BYTE,
bufsize: DWORD,
pCount: PTR DWORD,
lpReserved: DWORD

WriteConsoleOutputAttribute PROTO,
handle: DWORD,
pAttribute: PTR WORD,
nLength: DWORD,
xyCoord: COORD,
lpCount: PTR DWORD

SetConsoleTextAttribute PROTO,
outHandle:DWORD,
NCOLOR:DWORD

WriteConsoleOutputCharacter PROTO,
outHAndle:DWORD,
pBuffer:PTR BYTE,
bufSize:DWORD,
xyCoord:COORD,
lpCount:PTR DWORD


;GetStdHandle PROTO, nStdHandle:DWORD
.data

inputHandle DWORD ?
buffer BYTE BufSize DUP(?),0,0
bytesRead dd ?
attributes WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 2,2,2,2
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 3,3,3,3
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 4,4,4,4
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 9,9,9,9
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 2,2,2,2
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 3,3,3,3
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 4,4,4,4
WORD 0Fh, 0Eh,0Dh,0Ch, 0Bh, 0Ah, 9,9,9,9
xyPos COORD <1,2>


.code
main PROC

INVOKE GetStdHandle, STD_INPUT_HANDLE
mov inputHandle, eax
INVOKE ReadConsole,
inputHandle,
ADDR buffer,
BufSize-2,
ADDR bytesRead,
0





INVOKE GetStdHandle, STD_OUTPUT_HANDLE
mov inputHandle, eax
INVOKE WriteConsole,
inputHandle,
ADDR buffer,
BufSize-2,
ADDR bytesRead,
0




INVOKE WriteConsoleOutputAttribute,
inputHandle,
ADDR attributes,
bufSize-2,
xyPos,
ADDR bytesRead


INVOKE WriteConsoleOutputCharacter,
inputHandle,
ADDR buffer,
BufSize - 2,
xyPos,
ADDR bytesRead

call ExitProcess
main ENDP
end main
