INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	Hello BYTE "Hello World", 0ah, 0dh, 0				;// creates a string called Hello
	Date BYTE "25 September 2018", 0ah, 0dh, 0			;// creates a string called Date

.code  		;// write your program here
main proc
	call SayHi											;// calls the SayHi procedure

	invoke ExitProcess,0
main endp
SayHi PROC												;// creates the SayHi procedure
		push edx										;// enters edx to procedure
		mov edx, OFFSET Hello							;// sets the location for the start of the string to edx
		call WriteString								;// writes string to console
		pop edx											;// restores the register before returning
		call SayDate									;// calls the SayDate procedure
		ret												;// returns to main

	SayHi ENDP				;// ends the SayHi procedure

	SayDate PROC					;// creates the SayDate procedure
		push edx					;// enters edx to procedure
		mov edx, OFFSET Date		;// sets the location for the start of the string to edx
		call WriteString			;// writes string to console
		pop edx						;// restores the register before returning
		ret							;// returns to main

	SayDate ENDP			;// ends the SayDate procedure

end main
