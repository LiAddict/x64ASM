;// Elle Grace Jen
;// CSIS-118B-3772
;// 09/02/2018
;// Lab 3C

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

	myArray BYTE 4 DUP(?)
	prompt BYTE "Enter a number", 0ah, 0dh, 0
	prompt2 BYTE "Enter a number 0-3", 0ah, 0dh, 0

		
.code  		;// write your program here
main PROC
		mov eax, 0					;// clears eax, null value
		mov edx, OFFSET prompt		;// moves the address of where first char site into edx prompt
		call WriteString			;// writes string to console
		call ReadInt				;// reads int from keyboard to store in eax
		mov myArray[0], al			;// stores value into the specified index of myArray

		call WriteString			;// writes string to console
		call ReadInt				;// reads int from keyboard to store in eax
		mov myArray[1], al			;// stores value into the specified index of myArray

		call WriteString			;// writes string to console
		call ReadInt				;// reads int from keyboard to store in eax
		mov myArray[2], al			;// stores value into the specified index of myArray

		call WriteString			;// writes string to console
		call ReadInt				;// reads int from keyboard to store in eax
		mov myArray[3], al			;// stores value into the specified index of myArray

			mov eax, 0				;// clears eax, null value
		mov edx, OFFSET prompt2		;// moves the address of where the first char site into edx prompt2
		call WriteString			;// writes the string to the console
		call ReadInt				;// reads int from keyboard to store in eax
		mov al, myArray[eax]		;// calls the value in myArray indicated by eax
		call WriteDec				;// writes the value in myArray indicated by eax on the screen
		call Crlf					;// adds a clear line to the console


	exit
main ENDP
END main
