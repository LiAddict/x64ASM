;// Elle Grace Jen
;// CSIS-118B-3772
;// 08/26/2018
;// Lab3

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

.code  		;// write your program here
main proc
	call Clrscr
	call	DumpRegs
	mov al, 22h			;//the mov al command only accesses the lower 2 bits
	call	DumpRegs
	mov ax, 2222h		;//the mov ax command only accesses the 4 lower bits
	call	DumpRegs
	mov ah, 33h			;//the mov ah command accesses the 2 upper bits of the lower 4 bits
	call	DumpRegs
	mov eax, 4444h		;//the mov eax command accesses all 8 bits of the registry,
	call	DumpRegs	;//but we only wrote in 4 bits so the lower bits of the 8 are replaced
						;//while the upper 4 were changed to zeros
	exit
main ENDP
END main
