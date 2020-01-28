;// Elle Grace Jen
;// CSIS-118B-3772
;// 12/02/2018
;// Lab9B

INCLUDE c:\Irvine\Irvine32.inc
INCLUDE macros.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword


.data 		;// write your data in this section

	valA REAL8 1.5									;// creates float variable
	valB REAL8 2.5									;// creates float variable
	valC REAL8 3.0									;// creates float variable
	valD REAL8 ?; +6.0								;// creates float variable
	valE REAL8 1.33									;// creates float variable
	prompt BYTE "The result is:", 0ah, 0dh, 0		;// creates string that declares result
		

.code  		;// write your program here
main PROC
fld valB				;// write valB to the stack
fchs					;// change sign st(0)
fld valA				;// write valA to the stack
fadd					;// adds st(0) to st(1), destination st(0)
fld valC				;// write valC to the stack
fchs					;// change sign
fadd					;// adds st(0) to st(1), destination st(0)
fmul valA				;// st(0) *= valC
fstp valD				;// stores st(0) to valD
fld valA				;// writes valA to the stack
fmul valB				;// st(0) *= valB
fmul valE				;// st(0) *= valE
fld valD				;// writes valD to the stack
fadd					;// adds valD to st(0)
fstp valD				;// stores st(0) to valD
fld valD				;// writes valD to the stack
mov edx, OFFSET prompt	;// moves prompt location to edx
call WriteString		;// writes prompt to the console
call WriteFloat			;// writes float to the console

	exit
main endp


end main
