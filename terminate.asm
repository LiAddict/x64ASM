;// Krista Ghazaleh
;// CSIS-118B-3772
;// 11/25/2018
;// Lab9A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

strRemove PROTO, pStart:PTR BYTE, nChars:DWORD
StrNextWord PROTO, pStart:PTR BYTE, dLim:DWORD

.data 		;// write your data in this section

		target BYTE 101 DUP(?)															;// indicates text is to be read from input
		prompt BYTE "Enter a character delimiter from the string.", 0ah, 0dh, 0			;// prompts for a delimiter
		pString BYTE "Enter a string to be terminated.", 0ah, 0dh, 0					;// prompts for a string
		delim DWORD ?																	;// holds the char delimiter


.code  		;// write your program here
main PROC
	mov edx, OFFSET pString							;// moves address of pString to the memory location
	call WriteString								;// writes the string to the console
	mov edx, OFFSET target							;// move beginning of target to the location to be set by user
	mov ecx, 50										
	call ReadString									;// takes in user input

	mov edx, OFFSET prompt							;// calls prompt to the location
	call WriteString								;// writes string to the console
	call ReadChar									;// takes user input as a char
	mov delim, eax									;// moves the char to the delim variable
	call WriteChar									;// writes char to the console
	call Crlf
	INVOKE StrNextWord, ADDR [target + 4], delim	;// calls StrNextWord procedure with parameters
	mov edx, OFFSET target							;// moves address of target to the location
	call WriteString								;// writes target to the console
	call Crlf										;// calls a clear line to the screen


	exit
main endp

StrRemove PROC, pStart:PTR BYTE, nChars:DWORD			;// creates StrRemove procedure and creates parameters
INVOKE Str_length, pStart								;// calls two parameters
mov ecx, eax											;// ecx holds length of string
.IF nChars <= ecx										;// compares nChars and the string length
	sub ecx, nChars										;// set counter
.ENDIF													;// ends if statement

mov esi, pStart											;// points to the string
add esi, nChars											;// points to first character to copy
mov edi, pStart											;// point to destination position
cld														;// clear direction flag
rep movsb												;// move the bytes
mov BYTE PTR[edi], 0									;// null terminate the string
ret														;// returns to main

StrRemove ENDP											;// ends StrRemove procedure

StrNextWord PROC, pStart:PTR BYTE, dLim:DWORD				;// create StrNextWord procedure and creates parameters
	INVOKE Str_length, pStart								;// calls two parameters
	mov ecx, eax											;// stores string length as count
COMPDLIM:													;// establishes first loop that compares each char
	dec ecx													;// decrements ecx
	mov edi, pStart											;// moves the string to the memory location
	mov eax, pStart[ebx]									;// copies each char to the eax for comparison with delimiter
	.IF ecx == 0											;// compares ecx with 0					
		ret													;// returns to main if ecx is zero
	.ENDIF													;// ends if statement
	inc ebx													;// increases ebx
	cmp eax, dLim											;// compares what is in eax with dLim
	jne COMPDLIM											;// if no match is found, jump back to COMPDLIM
	JZ CHARMATCH											;// if a match is found, jump to CHARMATCH

CHARMATCH:													;// declares CHARMATCH label
mov esi, pStart												;// points to the string
mov edi, pStart												;// point to destination position
mov ecx, ebx												;// sets count for the new loop
mov ebx, 0													;// clears the ebx
L1:															;// declares loop
	cld														;// clear direction flag
	rep movsb												;// move the bytes
	mov pStart[ebx], 0										;// null terminate the string
	inc ebx													;// increases the ebx	
loop L1														;// loops until count is zero
ret															;// returns to main
StrNextWord ENDP											;// ends StrNextWord procedure

end main