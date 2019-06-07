INCLUDE Irvine32.inc

.code
strCat PROC
	
	push ebp						;// save the stack base pointer
	mov ebp, esp					;// setup stack from strCat
	mov ebx, [ebp + 20]				;// get strlength
	mov eax, [ebp + 8]				;// get first string
	mov esi, [ebp + 16]				;// get final string
	call str_copy					;// copies first string to final string
	mov [esi], eax					;// copy first string to final string
	add esi, ebx					;// get new index
	mov eax, 0						;// clear eax
	mov eax, [ebp + 12]				;// get second string
	mov [esi], eax					;// move second string to second half of final string
	call str_copy					;// copies second string to final string
	push esi						;// writes final string to the stack
	pop ebp							;// restores stack base pointer
	
	ret								;// returns to main procedure
strCat ENDP
END