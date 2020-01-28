;// Elle Grace Jen
;// CSIS-118B-3772
;// 09/09/2018
;// Test 1

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	
	num1 WORD ?			;//creates a WORD variable to be entered by the user
	num2 WORD ?			;//creates a WORD variable to be entered by the user
	num3 DWORD ?			;//creates a DWORD variable to be entered by the user
	num4 DWORD ?			;//creates a DWORD variable to be entered by the user
	prompt BYTE "Please enter a number", 0ah, 0dh, 0		;// prompts the user with the string
	prompt2 BYTE "The sum of your numbers is", 0ah, 0dh, 0	;// prompts the user with the string
	prompt3 BYTE "Your Numbers in reverse order are:"		;// prompts the user with the string


		
.code  		;// write your program here
main PROC
		mov eax, 0									;// clears eax, null value
		mov edx, OFFSET prompt						;// moves the address of where first char site into edx prompt
		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov num1, ax								;// moves int from eax to num

		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov num2, ax								;// stores value into the specified index of myArray

		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov num3, eax								;// stores value into the specified index of myArray

		call WriteString							;// writes string to console
		call ReadInt								;// reads int from keyboard to store in eax
		mov num4, eax								;// stores value into the specified index of myArray
		
		
		mov edx, OFFSET prompt2						;// indicates where the memory of prompt will be
		call WriteString							;// writes prompt to the screen
		mov ax, num1								;// moves the value in num1 to ax
		add ax, num2								;// adds the value in num2 to ax
		mov edx, eax								;// moves the value in eax to edx

		mov eax, num3								;// moves the value stored in num3 to eax
		add eax, num4								;//	adds the value in eax to the value in num4
		add eax, edx								;// adds what is stored in edx to eax
		call WriteDec								;// writes the sum to the console
		call Crlf									;// adds a clear line to the console

			mov eax, 0								;// clears eax, null value
		mov edx, OFFSET prompt3						;// moves the address of where the first char site into edx prompt2
		call WriteString							;// writes the string to the console
		call Crlf									;// adds a clear line to the console
		mov eax, num4								;// moves what is in num4 to eax
		call WriteDec								;// writes the value to the console
		call Crlf									;// adds a clear line to the console

		mov eax, num3								;// calls the value in num3 indicated by eax
		call WriteDec								;// writes the value to the console
		call Crlf									;// adds a clear line to the console

		mov ax, num2   								;// calls the value in num2 indicated by ax
		call WriteDec								;// writes the value to the console
		call Crlf									;// adds a clear line to the console

		mov ax, num1								;// calls the value in num1 indicated by eax
		call WriteDec								;// writes the value to the console
		call Crlf									;// adds a clear line to the console




	exit
main ENDP
END main
