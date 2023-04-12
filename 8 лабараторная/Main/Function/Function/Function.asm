
.686
.model flat, stdcall
option casemap : none
includelib kernel32.lib
include C:\Users\rst\Desktop\study\masm32\include\kernel32.inc
;----------------------------------------------------------------—
GENERIC_READ EQU 80000000h
DO_NOT_SHARE EQU 0
NULL EQU 0
OPEN_EXISTING EQU 3
FILE_ATTRIBUTE_NORMAL EQU 80h
STD_OUTPUT_HANDLE EQU -11
GENERIC_WRITE EQU 40000000h
FILE_END EQU 2
CreateFile EQU <CreateFileA>
WriteConsole EQU <WriteConsoleA>
HANDLE TEXTEQU <DWORD>
FILE_SHARE_READ = 00000001h
FILE_SHARE_WRITE = 00000002h
;----------------------------------------------------------------—
.data
handle dword 0
buffer dword 512 dup(?)
bytesRead dword 0
;----------------------------------------------------------------—

.code
ReadDrive PROC C driveName: DWORD

INVOKE CreateFile,
driveName, GENERIC_READ,
FILE_SHARE_READ+FILE_SHARE_WRITE,
NULL,
OPEN_EXISTING,
NULL,
NULL
mov handle,eax

INVOKE ReadFile,
handle,
ADDR buffer,
512,
ADDR bytesRead,
0


INVOKE CloseHandle, handle

mov eax, offset buffer

ret
ReadDrive ENDP
END