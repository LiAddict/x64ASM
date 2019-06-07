;// Krista Ghazaleh
;// CSIS-118B-3772
;// 10/21/18
;// Test 3

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	
			caseTable BYTE 'y'			;// lookup value
			DWORD YES_op				;// select procedure associated with value
		EntrySize = ($ - caseTable)		;// find Entry Size
			BYTE 'n'					;// lookup value
			DWORD NO_op					;// select procedure associated with value
		
				
	NumberofEntries = ($ - caseTable) / EntrySize		;// determines number of entries

	val DWORD ?

	prompt BYTE "Your bank is $10.00", 0ah, 0dh, 0															;// creates initial value string
	promptINSTR BYTE "Please enter your guess for the next roll.", 0ah, 0dh, 0								;// creates an instruction string
	promptINFO BYTE "It only costs $1.00 to play if you are correct I will pay you $10.00", 0ah, 0dh, 0		;// creates information string
	prompt2 BYTE "Your bank is $", 0ah, 0dh, 0																;// creates the value string
	promptLoss BYTE "Sorry, the dice rolled a ", 0ah, 0dh, 0												;// creates a loss string
	promptCont BYTE ". Continue?", 0ah, 0dh, 0																;// creates a continue string
	promptWin BYTE "Winner! The dice rolled a", 0ah, 0dh, 0													;// creates OR selection title
	promptTha BYTE "Thanks for playing your bank is $", 0ah, 0dh, 0											;// creates NOT selection title
	promptRet BYTE ". Come back real soon.", 0ah, 0dh, 0														;// creates a return prompt


.code  		;// write your program here
main PROC
			call Randomize					;// initializes starting value of RandomRange and Random32 procedures
			mov esi, 10						;// stores bank amount
			call YES_op						;// calls YES_op procedure

			mov edx, OFFSET promptCont		;// calls continue string to the location
			call WriteString				;// Writes string to the console
			call ReadChar					;// takes user input

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

YES_op PROC				;// declares the AND_op procedure
	push ebx			;// writes ebx to the top of the stack
	push ecx			;// writes ecx to the top of the stack

			mov edx, OFFSET prompt2			;// calls string to location
			call WriteString				;// writes initial value string to the console
			mov eax, esi					;// moves bank to eax
			call WriteInt					;// writes bank value to the console
			mov edx, OFFSET promptINSTR		;// calls instruction string to location
			call WriteString				;// writes instruction string to the console
			mov edx, OFFSET promptINFO		;// calls info string to location
			call WriteString				;// writes info string to the console
			call ReadInt					;// reads user input
			mov val, eax					;// stores user input to variable
			dec esi							;// costs a dollar for playing

		mov eax, 6			;// sets max int
		call RandomRange	;// calls a random int to be generated
		inc eax				;// compensates for n-1

		.IF val == eax						;// sets conditions for values to be equivalent
			mov edx, OFFSET promptWin		;// moves win string to location
			call WriteString				;// writes win string to console 
			mov edx, eax					;// moves dice value to edx
			call WriteInt					;// writes dice value to console
			add esi, 10						;// adds 10 to the bank for win
		.ELSE								;// establishes alternative conditions
			mov edx, OFFSET promptLoss		;// moves loss string to location
			call WriteString				;// writes loss string to the console
			mov edx, eax					;// moves dice value to the edx
			call WriteInt					;// writes dice value to the console
			.ENDIF							;// ends conditional statement

			mov edx, OFFSET promptCont		;// calls continue string to the location
			call WriteString				;// Writes string to the console
			call ReadChar					;// takes user input

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


	pop ecx			;// restores ecx value from the stack
	pop ebx			;// restores ebx value from the stack
			
		ret				;// returns to main procedure

YES_op ENDP				;// ends the AND_op procedure

NO_op PROC		;// declares the OR_op procedure
	push ebx	;// writes ebx to the top of the stack
	push ecx	;// writes ecx to the top of the stack

	mov edx, OFFSET promptTha	;// prints value string
	call WriteString			;// writes value string to the console
	mov eax, esi				;// copies esi value to eax
	call WriteInt				;// writes value to the console
	mov edx, OFFSET promptRet	;// calls return string to location
	call WriteString			;// prints return string to console


	pop ecx		;// restores ecx value from the stack
	pop ebx		;// restores ecx value from the stack
			
		ret		;// returns to main procedure

NO_op ENDP		;// ends the OR_op procedure

end main