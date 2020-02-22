INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

	myArray BYTE "abcdefghijkl"		;// creates BYTE array
	count DWORD	?					;// creates a count variable to be set
		
.code  		;// write your program here
main PROC
		mov ebx, 0			;// initialize ebx
		mov ecx, 4			;// set max chars			
		
	L1:
		mov count, ecx		;// sets counter
		mov ecx, 3			;// sets counter to 4
	L2:
		mov al, myArray[ebx]		;// moves ebx value of Array to al
		call WriteChar				;// writes specified Array value to console
		mov al, '	'				;// inserts tab between chars
		call WriteChar				;// writes tab to console after char
		inc ebx						;// moves to the next array index
		loop L2						;// loops until ecx is zero and them moves back to L1
		call crlf					;// calls a clear line to console
		mov ecx, count				;// stores count to ecx
		loop L1						;// loops L1 until ecx is zero
		

	exit
main ENDP
END main
