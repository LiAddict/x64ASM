;// Krista Ghazaleh
;// CSIS-118B-3772
;// 10/21/2018
;// Lab6A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter a number ", 0ah, 0dh, 0					;// creates a string
	oddMsg BYTE "Odd number ", 0ah, 0dh, 0					;// creates a string
	evenMsg BYTE "Even number ", 0ah, 0dh, 0					;// creates a string


.code  		;// write your program here
main proc
	
	call checkEven					;// calls procedure
	cmp eax, 1						;// compares eax to 1
	jz EVENBLABEL					;// uses even label if 1
	mov edx, OFFSET oddMsg			;// if not moves oddMsg to location
	call WriteString				;// writes odd msg
	JMP EXITOUT						;// jumps to exit 

	EVENBLABEL:						;// marks even label
		mov edx, OFFSET evenMsg		;// sets prompt to location
		call WriteString			;// writes string to console

		EXITOUT:		;// marks exit label
			exit		;// exits program


	invoke ExitProcess,0
main endp

	checkEven PROC							;// creates a procedure that checks for even or odd
		push edx		;// writes edx to the top of the stack
		push ebx		;// writes ebx to the top of the stack
		
		mov edx, OFFSET prompt	;// calls string to the location
		call WriteString		;// writes string to console
		call ReadInt			;// reads user input

		mov edx, 0		;// clears edx
		mov ebx, 2		;// divides input by 2
		div ebx			;// divides input by 2
		cmp edx, 0		;// checks for remainder
		jz EVENLABEL	;// even number label
		mov eax, 0
		
		
		
		EVENLABEL:			;// establishes even label
			mov eax, 1		;// stores 1 to eax if even
			
		pop ebx			;// restores ebx from the stack
		pop edx			;// restores edx from the stack
		

		ret				;// returns to main
	checkEven ENDP			;// ends the sumArray procedure
end main