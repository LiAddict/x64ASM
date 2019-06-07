;// Krista Ghazaleh
;// CSIS-118B-3772
;// 9/30/18
;// Lab5B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

		prompt BYTE "Enter a power", 0dh, 0ah, 0				;//prompts for a string, terminates with null
		prompt2 BYTE "Enter a base", 0dh, 0ah, 0				;//prompts for a string, terminates with null

.code  		;// write your program here
main PROC
	
	call power		;// calls the power procedure to run the code in power

	invoke ExitProcess,0
main ENDP
power PROC
	push ebx				;// writes ebx to the stack
	push ecx				;// writes ecx to the stack

		mov edx, OFFSET prompt		;// moves the address of where the first char sits into edx
		call WriteString			;// writes the string to the console
		call ReadInt				;// reads int from keyboard to store in eax
		mov ecx, eax				;// stores the power in the count

		mov edx, OFFSET prompt2		;// moves the address of where the first char sits into edx
		call WriteString			;// writes the string to the console
		call ReadInt				;// reads int from keyboard to store in eax
		mov ebx, eax				;// stores the base in the ebx to be multiplied
		dec ecx						;// decrements count so there isn't an extra power

	L1:
	mul ebx					;// multiplies ebx by eax
	loop L1					;// repeats code until count is zero
	call WriteDec			;// writes the product to console
	call Crlf				;// writes a clear line to the screen

	pop ecx					;// restores top value to ecx
	pop ebx					;// restores top value to ebx
			
	ret						;// returns to main
	power ENDP				;// ends power procedure

end main