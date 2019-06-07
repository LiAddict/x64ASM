;// Krista Ghazaleh
;// CSIS-118B-3772
;// 10/14/18
;// Midterm

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	
			caseTable BYTE '1'			;// lookup value
			DWORD AND_op				;// select procedure associated with value
		EntrySize = ($ - caseTable)		;// find Entry Size
			BYTE '2'					;// lookup value
			DWORD OR_op					;// select procedure associated with value
			BYTE '3'					;// lookup value
			DWORD NOT_op				;// select procedure associated with value
			BYTE '4'					;// lookup value
			DWORD XOR_op				;// select procedure associated with value
				
	NumberofEntries = ($ - caseTable) / EntrySize		;// determines number of entries

	promptTITLE BYTE "---- Boolean Calculator ----------", 0ah, 0dh, 0				;// creates a title string
	promptAND BYTE "1. x AND y", 0ah, 0dh, 0										;// creates the AND string
	promptOR BYTE "2. x OR y", 0ah, 0dh, 0											;// creates the OR string
	promptNOT BYTE "3. NOT x", 0ah, 0dh, 0											;// creates the NOT string
	promptXOR BYTE "4. x XOR y", 0ah, 0dh, 0										;// creates xOR string
	promptEXT BYTE "5. Exit program", 0ah, 0dh, 0									;// creates the exit string
	promptINSTR BYTE "Enter integer >>", 0ah, 0dh, 0								;// creates an instruction string
	promptHexINSTR BYTE "Enter a hexidecimal operand: ", 0ah, 0dh, 0				;// creates the hex choice string
	promptHexINSTR2 BYTE "Enter a second hexidecimal operand: ", 0ah, 0dh, 0		;// creates the second hex choice string
	promptResult BYTE "The 32-bit hexadecimal result is:		", 0ah, 0dh, 0		;// creates a display result string
	promptAndTITLE BYTE "Boolean AND", 0ah, 0dh, 0									;// creates AND selection title
	promptOrTITLE BYTE "Boolean OR", 0ah, 0dh, 0									;// creates OR selection title
	promptNotTITLE BYTE "Boolean NOT", 0ah, 0dh, 0									;// creates NOT selection title
	promptXorTITLE BYTE "Boolean XOR", 0ah, 0dh, 0									;// creates XOR selection title


.code  		;// write your program here
main PROC
			call ChooseProcedure		;// calls the menu and prompt for input

		mov ebx, OFFSET caseTable			;// moves caseTable to ebx
		mov ecx, NumberOfEntries			;// sets the count for loop
		
		L1:
			cmp al, [ebx]				;// match found?
			jne L2						;// if not continue
			call NEAR PTR [ebx + 1]		;// yes call procedure
			call WriteString			;// display message
			call Crlf					;// calls a clear line to the console
			jmp L3						;// skips to exit after calling procedure
		L2:								;// Declares code in loop 2
			add ebx, EntrySize			;// adds size to move to next case
			loop L1						;// loops loop 1
		L3:
			exit						;// exits

	invoke ExitProcess,0
main ENDP

ChooseProcedure PROC					;// declares menu procedure
		mov edx, OFFSET promptTITLE		;// calls title string
		call WriteString				;// writes title 
		call Crlf						;// calls a clear line 

		mov edx, OFFSET promptAND		;// calls AND menu choice
		call WriteString				;// writes menu choice

		mov edx, OFFSET promptOR		;// calls OR menu choice
		call WriteString				;// writes menu choice

		mov edx, OFFSET promptNOT		;// calls NOT menu choice
		call WriteString				;// writes menu choice

		mov edx, OFFSET promptXOR		;// calls XOR menu choice
		call WriteString				;// writes XOR menu choice
			
		mov edx, OFFSET promptEXT		;// calls EXIT menu choice
		call WriteString				;// writes EXIT menu choice

		call Crlf						;// writes a clear line to the console
		mov edx, OFFSET promptINSTR		;// calls instruction line
		call WriteString				;// writes instruction line
		call ReadChar					;// stores user input data to eax
		call Crlf						;// writes a clear line to the console
		
ret										;// returns to main procedure
ChooseProcedure ENDP					;// ends ChooseProcedure

AND_op PROC				;// declares the AND_op procedure
	push ebx			;// writes ebx to the top of the stack
	push ecx			;// writes ecx to the top of the stack

	mov edx, OFFSET promptAndTITLE		;// calls the indicator of AND
	call WriteString					;// writes AND title
	call Crlf							;// writes a clear line to the console

		mov edx, OFFSET promptHEXINSTR		;// calls hexadecimal input instruction
		call WriteString					;// writes hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ebx, eax						;// writes user input to ebx
		
		mov edx, OFFSET promptHexINSTR2		;// calls second hexadecimal input instruction
		call WriteString					;// writes second hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ecx, eax						;// writes user input to ecx

		mov edx, OFFSET promptResult	;// calls diplay result string
		call WriteString				;// writes result string to the console
		mov edx, 0						;// clears edx register

		AND ecx, ebx		;// performs boolean AND operation
		call WriteHex		;// writes result to console
		

	pop ecx			;// restores ecx value from the stack
	pop ebx			;// restores ebx value from the stack
			
		ret				;// returns to main procedure

AND_op ENDP				;// ends the AND_op procedure

OR_op PROC		;// declares the OR_op procedure
	push ebx	;// writes ebx to the top of the stack
	push ecx	;// writes ecx to the top of the stack

	mov edx, OFFSET promptOrTITLE			;// calls indicator of OR
	call WriteString						;// writes OR title
	call Crlf								;// writes a clear line to the console

		mov edx, OFFSET promptHexINSTR		;// calls hexadecimal input instruction
		call WriteString					;// writes hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ebx, eax						;// writes user input to ebx
		
		mov edx, OFFSET promptHexINSTR2		;// calls second hexadecimal input instruction
		call WriteString					;// writes second hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ecx, eax						;// writes user input to ecx

		mov edx, OFFSET promptResult	;// calls diplay result string
		call WriteString				;// writes result string to the console
		mov edx, 0						;// clears edx

		OR ecx, ebx		;// performs boolean OR operation
		call WriteHex	;// writes result to console


	pop ecx		;// restores ecx value from the stack
	pop ebx		;// restores ecx value from the stack
			
		ret		;// returns to main procedure

OR_op ENDP		;// ends the OR_op procedure

NOT_op PROC			;// declares NOT_op procedure
	push ebx		;// writes ebx to the top of the stack
	push ecx		;// writes ecx to the top of the stack

	mov edx, OFFSET promptNotTITLE			;// calls indicator of NOT
	call WriteString						;// writes NOT title
	call Crlf								;// writes a clear line to the console

		mov edx, OFFSET promptHexINSTR		;// calls hexadecimal input instruction
		call WriteString					;// writes hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ebx, eax						;// writes user input to ebx
		
		mov edx, OFFSET promptResult	;// calls diplay result string
		call WriteString				;// writes result string to the console
		mov edx, 0						;// clears edx

		NOT ebx			;// performs boolean NOT operation
		call WriteHex	;// writes the result to the console
		call Crlf		;// writes a clear line to the console
		mov edx, 0		;// clears edx

	pop ebx		;// restores ebx value from the stack
	pop ecx		;// restores ecx value from the stack

NOT_op ENDP		;// ends the NOT_op procedure

XOR_op PROC		;// declares the XOR_op procedure
	push ebx	;// writes ebx to the top of the stack
	push ecx	;// writes ecx to the top of the stack

	mov edx, OFFSET promptXorTITLE			;// calls indicator of xOR
	call WriteString						;// writes xOR title
	call Crlf								;// writes a clear line to the console
	
		mov edx, OFFSET promptHexINSTR		;// calls hexadecimal input instruction
		call WriteString					;// writes hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ebx, eax						;// writes user input to ebx
		
		mov edx, OFFSET promptHexINSTR2		;// calls second hexadecimal input instruction
		call WriteString					;// writes second hexadecimal input instruction
		call ReadHex						;// stores user input to eax
		mov ecx, eax						;// writes user input to ebx

		mov edx, OFFSET promptResult	;// calls diplay result string
		call WriteString				;// writes result string to the console
		mov edx, 0						;// clears edx
		
		XOR ecx, ebx		;// performs boolean XOR operation
		mov eax, ecx		;// writes result to eax
		call WriteString	;// prints result

	pop ebx			;// restores ebx from the stack
	pop ecx			;// restores ebx from the stack

	XOR_op ENDP		;// end the XOR_op procedure



end main