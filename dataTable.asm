;// Krista Ghazaleh
;// CSIS-118B-3772
;// 08/26/2018
;// Lab2

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	msg1 BYTE "Here are my fictional and historical books:", 0dh, 0ah, 0
	title11 BYTE "1984", 0
	author1 BYTE "George Orwell", 0
	publisher1 BYTE "Harvill Secker",0
	title21 BYTE "The Outsiders", 0
	author2 BYTE "S.E. Hinton", 0
	publisher2 BYTE "Viking Press", 0
	msg BYTE 0dh, 0ah, 0					;//CR LF
	tabr BYTE 9h, 0							;//TAB

.code  		;// write your program here
main PROC
	call Clrscr

	mov edx,offset msg1		;// moves into edx registry the first message string
	call WriteString		;// writes the message to the console
	mov edx,offset msg		;// moves into edx registry the first message string
	call WriteString		;// writes the message to the console

	mov edx,offset title11	;// moves into edx registry the first book title string
	call WriteString		;// writes the message to the console

	mov edx,offset tabr		;//moves into the edx registry the tab string
	call WriteString		;//writes the message
	mov edx,offset tabr		;//moves into the edx registry the tab string
	call WriteString		;//writes the message

	mov edx,offset author1	;// moves into edx registry the first author
	call WriteString		;// writes the message to the console
	mov edx,offset tabr		;// moves into edx registry the tab string
	call WriteString		;// writes the message to the console
	mov edx,offset tabr		;//moves into the edx registry the tab string
	call WriteString		;//writes the message

	mov edx,offset publisher1	;//moves into edx the publisher string
	call WriteString			;//writes the message to the console
	mov edx,offset tabr			;//moves into edx registry the tab string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into the edx registry the crlf string
	call WriteString			;// writes the message
	mov edx,offset msg			;//moves into the edx registry the crlf string
	call WriteString			;//writes the message

	mov edx,offset msg		;// moves into edx registry the first message string
	call WriteString		;// writes the message to the console

	mov edx,offset title21	;// moves into edx registry the first book title string
	call WriteString		;// writes the message to the console

	mov edx,offset tabr		;//moves into the edx registry the tab string
	call WriteString		;//writes the message

	mov edx,offset author2	;// moves into edx registry the first author
	call WriteString		;// writes the message to the console
	mov edx,offset tabr		;// moves into edx registry the tab string
	call WriteString		;// writes the message to the console
	mov edx,offset tabr		;//moves into the edx registry the tab string
	call WriteString		;//writes the message

	mov edx,offset publisher2	;//moves into edx the publisher string
	call WriteString			;//writes the message to the console
	mov edx,offset tabr			;//moves into edx registry the tab string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into the edx registry the crlf string
	call WriteString			;// writes the message
	mov edx,offset msg			;//moves into the edx registry the crlf string
	call WriteString			;//writes the message


	invoke ExitProcess,0
main endp
end main