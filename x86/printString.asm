; program to print a string of variable length
section .data
	text db "Hello world", 10, 0
	text2 db "Hello?", 10, 0
	
section .text
	global _start

_start:
	; printing first string example
	mov rax, text
	call _print	
	
	; printing second string example
	mov rax, text2
	call _print
	
	; exiting program without error
	mov rax, 60
	mov rdi, 0
	syscall


; -----------------------------------
; | input: rax as pointer to string |
; | output: print string at rax     |
; -----------------------------------
_print:
	push rax	; pushing the text address stored in rax in stack
	mov rbx, 0	; putting value 0 in rbx, which will act as a counter
_printLoop:
	inc rax		; incrementing the pointer to the text
	inc rbx		; incrementing the counter for iteration
	mov cl, [rax]	; moving the content at [rax] to cl register
	cmp cl, 0	; checking if value of cl register is null character
	jne _printLoop
	
	; print subroutine
	mov rax, 1
	mov rdi, 1
	pop rsi		; content of rax i.e the text will be popped and get stored in rsi register
	mov rdx, rbx	; moving the value of counter in rbx to rdx register, which represents the string length
	syscall
	
	ret
