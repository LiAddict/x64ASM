;// Krista Ghazaleh
;// CSIS-118B-3772
;// 11/04/2018
;// Lab7B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		prompt BYTE "Enter two numbers", 0dh, 0ah, 0		;// creates a string prompt
		result BYTE "The sum of the two is ", 0dh, 0ah, 0	;// creates a result prompt

		strNum1 BYTE 100 DUP(0)								;// creates a string with a max of 100 chars
		strNum2 BYTE 100 DUP(0)								;// creates second string with a max of 100 chars
		strResult BYTE 100 DUP(0)							;// creates a result string of max 100 chars
		sLength DWORD ?										;// creates a variable to hold string lengths
		lDiff	DWORD ?										;// creates a variable to hold the difference between string lengths
.code  		;// write your program here
main PROC
	mov edx, OFFSET prompt			;// moves prompt to the memory location
	call WriteString				;// prompt for input
	mov edx, OFFSET strNum1			;// get string
	mov ecx, SIZEOF strNum2			;// moves the size of the string to the ecx
	mov ebx, SIZEOF strNum1			;// gets size of string1
	sub ecx, ebx					;// subtracts two strings
	call ReadString					;// writes string to the console

	.IF ecx < ebx							;// compare ecx and ebx
											;// add zero place holder to ecx
		.ELSE								;// nest if
			.IF ebx > ecx					;// compare ebx and ecx
											;// add zero place holder
					.ELSE					;// two are equal
											;// leave as is
						.ENDIF
	.ENDIF
	
	mov edx, OFFSET strNum2			;// get string2
	mov ecx, SIZEOF strNum2			;// moves size of second string to ecx
	call ReadString					;// takes user input
	call StrLength					;// determine length of input
	mov ecx, eax					;// mov length to ecx
	mov sLength, ecx				;// save length of string
	mov ebx, 0

	clc								;// clear carryflag
L1:									;// declare loop 1
	mov ax, 0						;// clear ax
	call ReadString					;// reads user input
	mov al, strNum1[ecx - 1]		;// mov last chars to al
	adc al, strNum2[ecx - 1]		;// add numbers together
	aaa								;// adjust for ascii
	push ax							;// save char on stack			
	loop L1							;// loops through L1
	jnc createString				;// jumps to the label createString
	mov ax, '1'						;// save for carry
	push ax							;// save char on stack
	inc sLength						;// adds to the string length

createString:						;// declares the createString label
	mov ecx, 0						;// clears the ecx
L2:
	pop ax							;// pop stack into ax
	or ax, 3030h					;// convert to binary
	mov strResult[ecx], al			;// stores array index value
	inc ecx							;// adds to the ecx
	cmp ecx, sLength				;// compares ecx to sLength
	jne L2							;// jumps if we haven't popped everything to the stack

	mov edx, OFFSET result			;// moves result to the location
	call WriteString				;// writes string to the console
	mov edx, OFFSET strResult		;// moves the strResult to the location
	call WriteString				;// writes string to the console

	exit
main endp

end main