;// Krista Ghazaleh
;// CSIS-118B-3772
;// 09/09/2018
;// Lab 4A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

	myArray BYTE 4 DUP(?)							;// creates a WORD array of size 4 for which values are to be set
	prompt BYTE "Enter a number", 0ah, 0dh, 0		;// prompts the user with the string
	promptb BYTE "Enter a number 0-3"					

		
.code  		;// write your program here
main PROC
		mov edx, OFFSET prompt						;// moves the address of where first char site into edx prompt
		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov myArray[0], al							;// stores value into the specified index of myArray

		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov myArray[1], al							;// stores value into the specified index of myArray

		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov myArray[2], al							;// stores value into the specified index of myArray

		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov myArray[3], al							;// stores value into the specified index of myArray

		mov al, myArray[1]							;// moves the array value into ax
		xchg al, myArray[2]			    			;// exchanges the middle two array values, 1 and 2 stored in ax
		movzx eax, al								;// zeros the eax registry and then stores in what is at al, index 2
		call WriteDec								;// writes the value in myArray indicated on the screen
		call Crlf									;// calls a clear line to the console

		movzx eax, myArray[1]						;// clears the eax registry to store in what is at myArray[2]
		call WriteDec								;// writes the value in myArray indictated on the screen
	
	
		


	exit
main ENDP
END main