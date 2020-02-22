INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		getParameters BYTE "Enter three integers.", 0ah, 0dh, 0			;// creates a string that prompts a user to enter parameters
		sumNums BYTE "The sum of the three numbers is "					;// creates a string to present the sum
		first DWORD ?													;// creates a variable to hold first int
		second DWORD ?													;// creates a variable to hold second int
		third DWORD ?													;// creates a variable to hold third int
.code  		;// write your program here
main PROC

	mov eax, 0							;// clears eax
	mov ebx, 0							;// clears ebx
	mov edx, OFFSET getParameters		;// moves getParameters to the memory location
	call WriteString					;// writes string to the console
	call ReadInt						;// reads user input
	mov first, eax						;// stores int to variable
	call ReadInt						;// reads user input
	mov second, eax						;// stores int to variable
	call ReadInt						;// reads user input
	mov third, eax						;// stores int to variable
	push first							;// writes first value to the stack
	push second							;// writes second value to the stack
	push third							;// writes third value to the stack
	call SumThree						;// calls SumThree procedure
	mov edx, OFFSET sumNums				;// moves sumNums to the memory location
	call WriteString					;// writes string to the console
	call WriteInt						;// writes int to the console

	exit
main endp

SumThree PROC					;// creates SumThree procedure

	push ebp					;// save the stack base pointer
	mov ebp, esp				;// setup stack from SumThree
	mov eax, [ebp + 8]			;// get parameter off stack
	add eax, [ebp + 12]			;// gets second parameter off the stack and adds two parameters
	add eax, [ebp + 16]			;// gets third parameter off the stack, adds parameter to sum of first 2
	pop ebp						;// restores stack base pointer
	ret							;// returns to main procedure

SumThree ENDP					;// ends SumThree procedure

end main
