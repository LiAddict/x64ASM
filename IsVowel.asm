;// Elle Grace Jen
;// CSIS-118B-3772
;// 11/11/2018
;// Lab8A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		myString BYTE "Enter a character", 0ah, 0dh, 0
		aVowel BYTE "Character is a vowel", 0ah, 0dh, 0
		noVowel BYTE "Character is not a vowel", 0ah, 0dh, 0
.code  		;// write your program here
main PROC

	mov eax, 0
	mov ebx, 0
	mov edx, OFFSET myString
	call WriteString
	call ReadChar
	push ax
	call IsVowel
	cmp ax, 1
	je AVOWL
	mov edx, OFFSET noVowel
	jmp EXITB
AVOWL:
	mov edx, OFFSET aVowel
EXITB:
	call WriteString

	exit
main endp

IsVowel PROC

	push ebp					;// save the stack base pointer
	mov ebp, esp				;// setup stack from IsVowel
	mov ax, [ebp + 8]			;// get parameter off stack
	
	cmp al, 'A'
	JE VOWEL
	cmp al, 'E'
	JE VOWEL
	cmp al, 'I'
	JE VOWEL
	cmp al, 'O'
	JE VOWEL
	cmp al, 'U'
	JE VOWEL
	cmp al, 'a'
	JE VOWEL
	cmp al, 'e'
	JE VOWEL
	cmp al, 'i'
	JE VOWEL
	cmp al, 'o'
	JE VOWEL
	cmp al, 'u'
	JE VOWEL
	mov eax, 0					;// false, not a vowel
	jmp EXITA
VOWEL:
	mov eax, 1					;// is a vowel
EXITA:
	pop ebp
	ret

IsVowel ENDP

end main

