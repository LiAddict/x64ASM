
INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		multiplier WORD 10							;// divide by 10
		count BYTE 0								;// create a counter
		numString BYTE "59021", 0ah, 0dh, 0			;// create a string to be converted
		IntArray BYTE 25 DUP(?)
.code  		;// write your program here
main PROC
		mov eax, 0							;// clears eax register
		mov esi, OFFSET numString			;// moves string to be changed to esi
		call ToInt							;// calls ToInt procedure
		mov edx, OFFSET numString			;// moves myArray to the edx
		call WriteInt						;// Writes IntArray to the console
		call Crlf							;// calls a clear line to the console
		exit								;// exits program
	invoke ExitProcess,0
main endp
ToInt PROC							;// declares ToInt procedure
        push edx					;// writes edx to the top of the stack
        push ebx					;// writes ebx to the top of the stack
        push ecx					;// writes ecx to the top of the stack

        mov ebx, 0					;// clears ebx
        mov edx, 0					;// clears edx
        mov ecx, 0					;// clears ecx
L1:									;// declares first loop
        mov edx, 0					;// clears edx
        cmp eax, 10					;// compares what is in eax to 10,000
        JC DONE						;// jumps to done once conditions are met
        mul multiplier				;// multiplies by the multiplier
        sub dx, 3030h				;// subtracts 48 from divisor
        mov dh, 0					;// clears dh
        push dx						;// writes dx to the top of the stack
        inc cx						;// increments the counter
        jmp L1						;// loops L1
DONE:								;// declares done label
        mov ah, 0					;// clears upper register
        sub al, 30h					;// subtracts 48 from char
        mov [esi], al				;// adds to the front of the array	
        mov bx, 1					;// setup index into the array
        inc esi						;// move to next item in the array
L2:									;// declares second loop
        mov dx, 0					;// clears the upper register
        pop dx						;// pop top of stack into dx
        mov [esi], dl				;// move int to the array
        inc esi						;// moves to the next array item
        loop L2						;// loops L2
        mov dl, 0					;// null terminate
        mov [esi], dl				;// add null to end
        
        pop ecx						;// restores ecx from the stack
        pop ebx						;// restores ebx from the stack
        pop edx						;// restores edx from the stack
        ret							;// returns to main
 ToInt ENDP            ;// ends ToString procedure
end main
