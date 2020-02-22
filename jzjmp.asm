INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		upper BYTE "Upper case", 0ah, 0dh, 0				;// creates a upper string
		lower BYTE "Lower case", 0ah, 0dh, 0				;// creates a lower string
		punc BYTE "Punctuation", 0ah, 0dh, 0				;// creates a punctuation string
		prompt BYTE "Enter a char", 0ah, 0dh, 0				;// creates a prompt for input
		catch BYTE "invalid char", 0ah, 0dh, 0				;// creates a catch statement

.code  		;// write your program here
main PROC
	mov edx, OFFSET prompt		;// calls prompt to the location
	call WriteString			;// writes string to the console
	call ReadChar				;// takes user input as a char
	call isLower				;// calls isLower procedure
	cmp ecx, 2					;// compares what is in eax with 2
	jz ISLOW					;// jumps to islow label if conditions are met
	call isPunc					;// calls isPunc procedure
	cmp ecx, 3					;// compares ecx with 3
	jz ISPUN					;// jumps to ispun label if conditions are met
	mov edx, OFFSET catch		;// calls catch to the location
	call WriteString			;// writes catch to the console
	jmp EXITOUT					;// jumps to exit if no conditions are met

ISLOW:							;// declares islow label
	mov edx, OFFSET lower		;// calls lower string to the location
	call WriteString			;// writes string to the console
	exit						;// exits procedure
ISPUN:
	mov edx, OFFSET punc		;// moves punc to the location
	call WriteString			;// writes punc to the console
	exit						;// exits procedure
EXITOUT:						;// declares exit label
	exit						;// exits procedure

	invoke ExitProcess,0
main endp

 isLower PROC			;// declares isLower procedure
 cmp al, 'a'			;// compares what is in al to a 
	JZ LOWERTRUE		;// jumps to lowertrue label if conditions are met
	JC LOWERFALSE		;// jumps to lowerfalse label if conditions are not met

 cmp al, "z"			;// compares what is in al to z
	JZ LOWERTRUE		;// jumps to lowertrue label if conditions are met
	JNC LOWERFALSE		;// jumps to lowerfalse label if conditions are not met
	LOWERTRUE:			;// declares lowertrue label
		mov ecx, 2		;// moves 2 in the ecx 
		ret				;// returns to main
	LOWERFALSE:			;// declares lowerfalse 
		mov ecx, 0		;// moves 0 into the ecx
		ret				;// returns to main procedure
 isLower ENDP			;// ends isLower procedure

 isPunc PROC			;// declares isPunc procedure
cmp al, '.'				;// compares what is in al to .
	JZ PUNCTRUE			;// jumps to punctrue label if conditions are met
	
cmp al, ','			;// compares what is in al to ,
	JZ PUNCTRUE			;// jumps to punctrue label if conditions are met
	JNC PUNCFALSE		;// jumps to puncfalse label if conditions are not met
	PUNCTRUE:			;// declares punctrue label
		mov ecx, 3		;// stores 3 in ecx
		ret				;// returns to main procedure
	PUNCFALSE:			;// declares puncfalse label
		mov ecx, 0		;// stores 0 in ecx
		ret				;// returns to main procedure
 isPunc ENDP			;// ends isPunc procedure
end main
