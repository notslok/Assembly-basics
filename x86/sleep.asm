; asm prog for indcuing as 5.5 sec sleep

section .data
	delay dq 5, 500000000 ;dq->"define quadruple word"... first value(5) is tv+sec and second is corresponding to tv_nsec
	
section .text
	global _start
	
_start:
	mov rax, 35		; id of sys_nanosec
	mov rdi, delay		; here we load the pointer to our delay into "rdi" register
	mov rsi, 0		; setting the second argument ogf this syscall to zero
	syscall			; finally calling the sys_nanosec syscall
	
	
	; exit syscall
	mov rax, 60
	mov rdi, 0
	syscall
