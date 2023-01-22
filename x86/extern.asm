; including External Files

%include "linux64.inc"

section .data
	text db "Hello, world!", 10, 0
	text2 db "slok.. ..", 10, 0
	
section .text
	global _start

_start:
	print text	; syscall for print is defined by macro "print" in the "linux64.inc" file
	print text2
	;------------------
	exit		; syscall for exit without error is defined by macro "exit" in the "linux64.inc" file
	
