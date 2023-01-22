%include "linux64.inc"

section .data
	filename db "myFile.txt", 0
	text db "Here's some text."
	
section .text
	global _start
	
_start:
	; --------- Open file
	
	mov rax, SYS_OPEN		; storing the id for sys_open system call
	mov rdi, filename		; pointer to zero terminated string for filename to open
	mov rsi, O_CREAT+O_WRONLY	; create(64) and write(1) flags
	mov rdx, 0644o			; file permissions(in octal) for different level of users
	syscall
	
	; --------- Write to file
	
	push rax			
	mov rdi, rax
	mov rax, SYS_WRITE
	mov rsi, text
	mov rdx, 17			; number of bytes to be written into the file
	syscall
	
	; --------- Close the file
	
	mov rax, SYS_CLOSE
	pop rdi				; file decriptor of the file to be closed...it assumes that it will be on top of the stack
	syscall
	
	exit
