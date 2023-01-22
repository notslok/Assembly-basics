;reading from a file

%include "linux64.inc"

section .data
	filename db "myFile.txt", 0

section .bss
	text resb 18
	
section .txt
	global _start
	
_start:
	;open the file ------------
	
	mov rax, SYS_OPEN
	mov rdi, filename
	mov rsi, O_RDONLY
	mov rdx, 0
	syscall
	
	;read from file -----------
	
	push rax
	mov rdi, rax
	mov rax, SYS_READ
	mov rsi, text
	mov rdx, 17
	syscall
	
	;close file ---------------
	
	mov rax, SYS_CLOSE
	pop rdi
	syscall
	
	print text
	exit
