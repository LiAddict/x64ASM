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
	mov edx, OFFSET prompt							;// prompt for input
		call WriteString							;// writes string to console to prompt user

		mov edx, OFFSET text						;// setup for input
		mov ecx, 50									;// set max chars
		call ReadString								;// record user input
		
		call StrLength								;// get number of characters
		mov ebx, eax								;// initialize ebx
		mov edx, OFFSET text						;// setup for output
		mov edx, 0									;// clears the edx registry
		mov ecx, 2									;// sets the dividing 
		div ecx										;// divides eax by ecx value
		mov ecx, 0									;// clears ecx
		mov ecx, eax								;// set the count to half stringlength	
		mov ebx, eax								;// initialize ebx
		dec ebx										;// reduces ebx so position zero may exchange
		
		
	L1:
		mov al, text[ebx]			;// moves ebx value of Array to al
		xchg text[ecx], al			;// swaps the data in al and the count position of text
		mov text[ebx], al			;// enters the data from al back to the string
		inc ebx						;// decrements to the next array index
		loop L1						;// loops L1 until ecx is zero
		mov edx, OFFSET text		;// calls text to memory location
		call WriteString			;// writes the string to the console


	exit
main ENDP
END main
