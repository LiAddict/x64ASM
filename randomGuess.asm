;// Krista Ghazaleh
;// CSIS-118B-3772
;// 10/23/2018
;// Lab6B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Guess a number between 1 and 10.", 0ah, 0dh, 0										;// creates an instruction string
	outPrompt BYTE " guesses to guess correctly", 0ah, 0dh, 0										;// creates a response string
	contPrompt BYTE "Would you like to play again? Enter 1 for yes or 2 for no.", 0ah, 0dh, 0		;// asks user if they would like to play again
	rand DWORD 0																					;// creates a variable called rand
	count DWORD 0																					;// creates a variable called count
	decision DWORD ?																				;// creates a variable called decision

.code  		;// write your program here
main PROC
	PLAYAGAIN:				;// declares play again label
	call getRandomNumber	;// calls the getRandomNumber procedure

	TOP:
		mov edx, OFFSET prompt		;// calls prompt to the location
		call WriteString			;// Writes string to the console
		call ReadInt				;// get the guess
		inc count					;// keep count of number of guesses
		cmp eax, rand				;// compares generated number to the guess
		jnz TOP						;// loop if guess is incorrect

			mov eax, count					;// copy count to eax
			call WriteDec					;// write count to the console
			mov edx, OFFSET outPrompt		;// calls outPrompt to the location
			call WriteString				;// writes outPrompt to the console
			call Crlf						;// calls a clear line to the console
			mov count, 0
			mov edx, OFFSET contPrompt		;// calls contPrompt to the location
			call WriteString				;// writes contPrompt to the console
			call readInt					;// takes user input
			mov decision, eax				;// stores input in decision
			mov eax, 2						;// moves 1 to eax
			cmp eax, decision				;// compares eax to decision
			jnz PLAYAGAIN					;// restarts game if input is yes
				
	EXITOUT:		;// declares exit
	exit			;// exits



	invoke ExitProcess,0
main endp
 getRandomNumber PROC
	call Randomize			;// seeds the random number generator
	mov eax, 10				;// sets max for random number generator
	call RandomRange		;// get a value between 0-9
	inc eax					;// compensates n-1
	mov rand, eax			;// stores random number into rand variable
	ret						;// return to main
 getRandomNumber ENDP

end main