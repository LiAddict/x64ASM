;// Elle Grace Jen
;// CSIS-118B-3772
;// 12/14/2018
;// Final
INCLUDE c:\Irvine\Irvine32.inc
FillArray PROTO,				;// declares FillArray proto
myArray: PTR DWORD,				;// creates array parameter that points to a DWORD
ArrayLength: DWORD				;// creates parameter to hold arraylength
PrintArrays PROTO,				;// declares PrintArrays proto
oneArray: PTR DWORD,			;// creates array parameter that points to a DWORD
twoArray: PTR DWORD,			;// creates array parameter that points to a DWORD,
cLength: DWORD					;// creates parameter to hold the length of each column
FindPositive PROTO,				;// declares FindPositive procedure
thisArray: PTR DWORD,			;// creates array parameter that points to a DWORD
plusArray: PTR DWORD,			;// creates array parameter that points to a DWORD
ArrayLength: DWORD				;// creates DWORD parameter to hold array length
CalculateSumOfArrays PROTO,		;// declares CalculateSumOfArrays procedure
oneArray: PTR DWORD,			;// creates array parameter that points to a DWORD
twoArray: PTR DWORD,			;// creates array parameter that points to a DWORD
ArrayLength: DWORD				;// creates DWORD parameter for the length of each column (number of rows per column)

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	
	firstArray DWORD 12 DUP(?)												;// creates the array whose values are to be entered by the user
	secondArray DWORD 12 DUP(?)												;// creates the array whose values are to be entered by the user
	positivefirstArray DWORD 12 DUP(?)										;// creates array to store positive numbers with max size 12
	positivesecondArray DWORD 12 DUP(?)										;// creates array to store positive numbers with max size 12
	prompt BYTE "Please enter 12 numbers.", 0ah, 0dh, 0						;// creates a prompt for the user to fill the array
	listPrompt BYTE "The numbers in your arrays are:", 0ah, 0dh, 0			;// creates a declaration for the list of array numbers
	positive BYTE "The positive numbers found are", 0ah, 0dh, 0				;// declares the list of positive numbers in the array
	noPositive BYTE "No positive number found in the array.", 0ah, 0dh, 0	;// declares no positives if none are found
	sumArrays BYTE "The sums of the arrays are:", 0ah, 0dh, 0				;// declares sums of arrays
		
.code  		;// write your program here
main PROC
	INVOKE FillArray,				;// invokes FillArray procedure
	ADDR firstArray,				;// provides array parameter
	12								;// provides parameter for array length
	INVOKE FillArray,				;// invokes FillArray procedure
	ADDR secondArray,				;// provides array parameter
	12								;// provides parameter for array length
	INVOKE PrintArrays,				;// invokes PrintArray procedure
	ADDR firstArray,				;// provides array parameter
	ADDR secondArray,				;// provides array parameter
	12								;// provides column length (number of rows per column)
	INVOKE CalculateSumOfArrays,	;// invokes CalculateSumOfArrays procedure
	ADDR firstArray,				;// provides array parameter that points to a DWORD
	ADDR secondArray,				;// provides array parameter that points to a DWORD
	12								;// provides DWORD parameter to hold array size
	INVOKE FindPositive,			;// invokes FindPositive procedure
	ADDR firstArray,				;// provides array parameter that points to a DWORD
	ADDR positivefirstArray,		;// provides array parameter that points to a DWORD
	12								;// provides DWORD parameter to hold array size
	INVOKE FindPositive,			;// declares FindPositive procedure
	ADDR secondArray,				;// provides array parameter that points to a DWORD
	ADDR positivesecondArray,		;// provides array parameter that points to a DWORD
	12								;// provides DWORD parameter to hold array size
	
	exit
main ENDP
FillArray PROC,					;// declares fill2DArray procedure
myArray: PTR DWORD,				;// creates array parameter that points to a DWORD
ArrayLength: DWORD				;// creates DWORD parameter to hold array length
	mov ecx, ArrayLength		;// stores array size length to the ecx
	mov edi, myArray			;// stores oneArray in edi
	push ecx					;// save array size	
	mov edx, OFFSET prompt		;// moves address of string to the memory location
	call WriteString			;// writes instruction to the console
L1:								;// declares first loop label
	call ReadInt				;// reads user input
	mov [edi], eax				;// Store value in the array
	add edi, 4					;// move to next DWORD
	loop L1						;// loops until ecx reaches zero
	call Crlf					;// calls a blank line to the console
	ret							;// returns to main procedure
FillArray ENDP					;// ends fill2DArray procedure
PrintArrays PROC,				;// declares fill2DArray procedure
oneArray: PTR DWORD,			;// creates array parameter that points to a DWORD
twoArray: PTR DWORD,			;// creates array parameter that points to a DWORD
cLength: DWORD					;// creates DWORD parameter for the length of each column (number of rows per column)
	mov edx, OFFSET listPrompt	;// moves address of string to edx
	call WriteString			;// writes string to the console
	call Crlf					;// calls a blank line to the console
	mov ecx, cLength			;// stores array size length to the ecx
	push ecx					;// save array size	
	mov ebx, 0					;// clears ebx
L1:								;// declares loop label
	mov edi, oneArray			;// stores oneArray in edi
	add edi, ebx				;// adds ebx and edi
	mov eax, [edi]				;// stores array value in eax
	call WriteInt				;// writes array value to the console
	mov al, 09h					;// tab character
	call WriteChar				;// Write the tab
	mov edi, 0					;// clear edi
	mov edi, twoArray			;// stores twoArray in edi
	add edi, ebx				;// adds edi and ebx to reach array index
	mov eax, [edi]				;// stores array value in eax
	call WriteInt				;// writes array value to the console
	call Crlf					;// writes clear line to the console
	add ebx, 4					;// increments ebx to move to next DWORD
	loop L1						;// loops until ecx reaches zero
	ret							;// returns to main procedure
PrintArrays ENDP				;// ends PrintArrays procedure
FindPositive PROC,				;// declares fill2DArray procedure
thisArray: PTR DWORD,				;// creates array parameter that points to a DWORD
plusArray: PTR DWORD,			;// creates array parameter that points to a DWORD
ArrayLength: DWORD				;// creates DWORD parameter to hold array length
	mov ecx, ArrayLength		;// stores array length in ecx
	mov ebx, 0					;// clears the ebx
	mov ebp, 0					;// clears the ebp
	mov edi, thisArray			;// stores thisArray in edi
	mov esi, plusArray			;// stores plusArray in esi
L1:								;// declares L1 label
	mov eax, [edi]				;// stores array value in eax
	.IF eax > 0					;// checks for a positive
		mov ebx, 1				;// moves 1 to the ebx
		mov [esi], eax			;// moves positive array value to plusArray
		add esi, 4				;// moves to next index value
		add edi, 4				;// moves to next index value
		inc ebp					;// adds 1 to the ebp
	.ELSE						;// gives instructions for nonpositive
		add edi, 4				;// moves to next index value
	.ENDIF						;// ends conditional statement
	loop L1						;// loops to classify next array value
.IF ebx == 1					;// checks for positivity
	mov edx, OFFSET positive	;// moves address of string to edx
	call WriteString			;// writes the string to the console
	mov ecx, ebp					;// stores plusArray length in ecx
	mov esi, plusArray			;// moves plusArray to the esi
L2:								;// declares L2 label
	mov eax, [esi]				;// stores index value into eax
	call WriteInt				;// writes value to the console
	add esi, 4					;// moves to next index value
	loop L2						;// loops L2
.ELSE							;// instructions for no positives found
	mov edx, OFFSET noPositive	;// moves address of string to edx
	call WriteString			;// writes the string to the console
	.ENDIF						;// ends conditional statement
	ret							;// returns to main procedure

FindPositive ENDP				;// ends FindPositive procedure
CalculateSumOfArrays PROC,		;// declares CalculateSumOfArrays procedure
oneArray: PTR DWORD,			;// creates array parameter that points to a DWORD
twoArray: PTR DWORD,			;// creates array parameter that points to a DWORD
ArrayLength: DWORD				;// creates DWORD parameter for the length of each column (number of rows per column)
	mov edi, oneArray			;// stores oneArray in edi
	mov esi, twoArray			;// stores plusArray in esi
	mov ecx, ArrayLength		;// stores arraylength in ecx
	mov edx, OFFSET sumArrays	;// stores address of string in edx
	call WriteString			;// writes string to the console
L1:								;// declares L1 label
	mov eax, [esi]				;// stores esi value in eax
	add [edi], eax				;// adds two array values
	mov eax, [edi]				;// stores sum in eax
	call WriteInt				;// writes int to the console
	call Crlf					;// calls a blank line to the console
	add edi, 4					;// moves to next index value
	add esi, 4					;// moves to next index value
	loop L1						;// loops L1
	ret							;// returns to main procedure
CalculateSumOfArrays ENDP		;// ends CalculateSumofArrays Procedure

END main
