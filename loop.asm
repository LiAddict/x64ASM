INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

	prompt BYTE "Enter a string", 0dh, 0ah, 0		;// prompts the user with the string
	text BYTE 101 DUP(?)							;// indicates text is to be read from input
		
.code  		;// write your program here
main PROC
		mov edx, OFFSET prompt						;// prompt for input
		call WriteString							;// writes string to console to prompt user

		mov edx, OFFSET text						;// setup for input
		mov ecx, 100								;// set max chars
		call ReadString								;// record user input

		call StrLength								;// get number of characters
		mov ebx, eax								;// initialize ebx
		mov edx, OFFSET text						;// setup for output
		inc eax										;// increases eax to the count so position zero may print
		mov ecx, eax								;// set the count to stringlength							

	L1:
		mov al, text[ebx]							;// store the char at the ebx value location
		call WriteChar								;// writes the char to the console
		call Crlf									;// writes a clear line to the console
		dec ebx										;// moves to the next position of the string through ebx
		loop L1										;// loops until ecx reaches zero
		
		

	exit
main ENDP
END main
