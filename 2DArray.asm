;// Krista Ghazaleh
;// CSIS-118B-3772
;// 12/02/2018
;// Lab9B

INCLUDE c:\Irvine\Irvine32.inc
	fill2DArray PROTO,				;// includes a proto for each procedure
	myArray: PTR DWORD,				;// Array points to DWORD value
	cLength: DWORD,					;// cLength variable with DWORD value
	rLength: DWORD					;// rLength variable with DWORD value
		
	print2DArray PROTO,				;// includes a proto for each procedure
	myArray: PTR DWORD,				;// Array points to DWORD value
	cLength: DWORD,					;// cLength variable with DWORD value
	rLength: DWORD					;// rLength variable with DWORD value

	sumOddEven PROTO,				;// includes a proto for each procedure
	myArray: PTR DWORD,				;// Array points to DWORD value
	sumOdds: DWORD,					;// sumOdds variable with DWORD value
	sumEvens: DWORD					;// sumEvens variable with DWORD value

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword


.data 		;// write your data in this section

	numArray DWORD 20 DUP(?)										;// creates a number array with 20 values to be determined
	prompt BYTE "The sum of the odds is:", 0ah, 0dh, 0				;// creates a prompt for input
	prompt2 BYTE "The sum of the evens is:", 0ah, 0dh, 0			;// creates a prompt for input
	oddSum DWORD ?													;// var for storing the odd sum
	evenSum DWORD ?													;// var for storing the even sum


.code  		;// write your program here
main PROC
call Randomize

	INVOKE fill2DArray,					;// calls the fill2DArray procedure and fills its parameters
		ADDR numArray,					;// gives the address of numArray
		5,								;// gives value for number of columns
		4								;// gives value for number of rows
	INVOKE print2DArray,				;// calls the print2DArray procedure and fills its parameters
		ADDR numArray,					;// gives address of numArray
		5,								;// gives value for number of columns
		4								;// gives value for number of rows
	INVOKE sumOddEven,					;// calls the fill2DArray procedure and fills its parameters
		ADDR numArray,					;// gives the address of numArray
		oddSum,							;// passes a variable that will hold sum of odds
		evenSum							;// passes a variable that will hold sum of evens

		mov edx, OFFSET prompt			;// moves the address of prompt to the location
		call WriteString				;// writes string to the console
		mov eax, oddSum					;// stores oddSum in eax to be printed
		call WriteInt					;// writes int to the console
		call Crlf						;// calls a blank line to the console
		
		mov edx, OFFSET prompt2			;// moves address of prompt2 to the memory location
		call WriteString				;// writes string to the console
		mov eax, evenSum				;// stores evenSum in eax to be printed
		call WriteInt					;// writes int to the console



	exit
main endp

fill2DArray PROC,				;// declares fill2DArray procedure
	myArray: PTR DWORD,			;// creates array parameter that points to a DWORD
	cLength: DWORD,				;// creates parameter to store number of columns
	rLength: DWORD				;// creates parameter to store number of rows
	
	mov ecx, rLength			;// stores row length to the ecx
	mov edi, myArray			;// stores myArray in edi
ROW:							;// declares row label
	push ecx					;// save row length
	mov ecx, cLength			;//	Initialize loop with column size
COL:							;// declares column label
	mov eax, 100				;// value between 0 and 99
	call RandomRange			;// Get random number
	add eax, 1					;// scale up range
	mov [edi], eax				;// Store value in the array
	add edi, 4					;// move to next DWORD
	loop COL					;// loops until ecx is zero
	pop ecx						;// Restore row length
	loop ROW					;// loops until ecx is zero
	ret							;// returns to main

fill2DArray ENDP				;// ends fill2DArray procedure

print2DArray PROC,				;// declares print2DArray procedure
	myArray: PTR DWORD,			;// creates array parameter that points to a DWORD
	cLength: DWORD,				;// creates parameter to store number of columns
	rLength: DWORD				;// creates parameter to store number of rows

	mov ecx, rLength			;// stores row length to the ecx
	mov edi, myArray			;// stores myArray in edi
ROW:							;// declares row label
	push ecx					;// save row length
	mov ecx, cLength			;//	Initialize loop with column size
COL:
	mov eax, [edi]				;// stores what is in array index value to eax
	call WriteDec				;// writes value to the console
	mov al, 09h					;// tab character
	call WriteChar				;// Write the tab
	add edi, 4					;// increase to next memory location
	loop COL					;// loops until ecx is zero
	pop ecx						;// Restore row count
	call Crlf					;// calls a blank line to the console
	loop ROW					;// loops until ecx is zero
	ret							;// returns to main
print2DArray ENDP				;// ends print2DArray procedure

sumOddEven PROC,				;// declares sumOddEven procedure
	myArray: PTR DWORD,			;// creates array parameter that points to a DWORD
	sumOdds: DWORD,				;// creates variable parameter to hold odd sums
	sumEvens: DWORD				;// creates variable parameter to hold even sums
	
	mov ecx, 20					;// copies array length to ecx
	mov edi, myArray			;// stores myArray to edi
	mov ebx, 2					;// stores divisor
	mov edx, 0					;// clears edx to hold remainder
CLASSINT:						;// declares CLASSINT label
	mov eax, [edi]				;// stores array value to eax
	add edi, 4					;// moves to next value in the index
	push eax					;// stores eax to the stack
	div ebx						;// divides eax by ebx
	pop eax						;// restores eax from the stack
.IF edx == 1					;// checks for a remainder
	add sumOdds, eax			;// adds array value to parameter
	add oddSum, eax				;// stores sum in variable
	.ELSE						;// gives instructions for no remainder
	add sumEvens, eax			;// adds array value to parameter
	add evenSum, eax			;// stores sum in variable
.ENDIF							;// ends conditional statement
	loop CLASSINT				;// loops to classify next array value
	ret							;// returns to main
sumOddEven ENDP					;// ends sumOddEven procedure

end main