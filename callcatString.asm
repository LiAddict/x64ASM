;// Elle Grace Jen
;// CSIS-118B-3772
;// 11/18/2018
;// Test 4 Main

INCLUDE c:\Irvine\Irvine32.inc
strCat PROTO

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		promptString BYTE "Enter a string", 0ah, 0dh, 0			;// prompts for a string
		firstString BYTE 101 DUP(?)								;// holds first string
		secondString BYTE 101 DUP(?)							;// holds second string
		finalString BYTE 101 DUP(?)								;// holds the concatenation of first and second string
		sLength DWORD ?											;// holds length of final string
.code  		;// write your program here
main PROC

	mov eax, 0							;// clears eax
	mov ebx, 0							;// clears ebx
	mov edx, OFFSET promptString		;// moves promptString to the memory location
	call WriteString					;// writes string to the console
	mov edx, OFFSET firstString			;// setup for input
	mov ecx, 50							;// set max chars
	call ReadString						;// record user input
	call StrLength						;// get number of characters
	mov ebx, eax						;// initialize ebx
	mov edx, OFFSET promptString		;// moves promptString to the memory location
	call WriteString					;// writes string to the console
	mov edx, OFFSET secondString		;// setup for input
	mov ecx, 50							;// set max chars
	call ReadString						;// record user input
	call StrLength						;// get number of chars
	mov sLength, eax					;// store chars in length
	mov edx, OFFSET firstString			;// moves string to memory location
	call WriteString					;// writes string to the console
	mov edx, OFFSET secondString		;// moves string to memory location
	call WriteString					;// writes string to the console
	add sLength, ebx					;// adds two stringlengths
	push sLength						;// writes sLength to the stack
	push OFFSET firstString				;// writes firstString to the stack
	push OFFSET secondString			;// writes secondString to the stack
	push OFFSET finalString				;// writes finalString to the stack
	push ebx							;// writes first string length to the stack
	call strCat							;// calls catString procedure from external catString.asm
	mov edx, [ebp + 24]					;// calls finalString to the memory location
	call WriteString					;// writes string to the console
	

	exit
main endp
end main
