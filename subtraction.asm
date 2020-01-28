;// Elle Grace Jen
;// CSIS-118B-3772
;// 09/02/2018
;// Lab 3B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		prompt BYTE "Enter a number", 0dh, 0ah, 0	;//prompts for a string, terminates with null

		val DWORD ?
		valb DWORD 0
.code  		;// write your program here
main PROC
		mov edx, OFFSET prompt		;// moves the address of where the first char sits into edx
		call WriteString			;// writes the string to the console
		call ReadInt				;// reads int from keyboard to store in eax
		mov val, eax				;// enters int to val

		call WriteString			;// calls prompt again from the location it already stays
		call ReadInt				;// reads second int from keyboard to store in eax

		mov valb, eax				;// enters int from eax to valb
		mov eax, val				;// enters int from val to eax
		mov edx, valb				;// enters int from valb to edx
		mov val, edx				;// enters int from edx to val

		sub eax, val				;// subtracts what is in val from what is in eax
		call WriteDec				;// calls value from eax
		call Crlf					;// adds a clear line

		;// enter two values and swap them around. Whatever is in val move to eax, move eax to val. Subtract val from eax

	exit
main ENDP
END main
