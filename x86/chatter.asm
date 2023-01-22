;data segment
section .data
	text1 db "What is your name?", 10  ;reserve a dATA bYte and value 10 represents newline("\n")
	text2 db "Hello, " 


; bss segment for reserving variable space
section .bss
	name resb 16	; reserving 16 bytes


; main code segment
section .text
	global _start	; making _start visible to external program


; linker always first searches for _start label in a program
_start:
	;calling subroutines
	call _printText1
	call _getName
	call _printText2
	call _printName
	
	
	; exiting program without error
	mov rax, 60
	mov rdi, 0	; setting error code to 0
	syscall
	
	
; ---- Subroutines ----

_getName:
	mov rax, 0	; calling STDIN 
	mov rdi, 0
	mov rsi, name	; file descriptor
	mov rdx, 16	; file size
	syscall
	ret
	
_printText1:
	mov rax, 1	; calling STDOUT
	mov rdi, 1
	mov rsi, text1	; file descriptor
	mov rdx, 19	; file size
	syscall
	ret
	
_printText2:
	mov rax, 1	; calling STDOUT
	mov rdi, 1
	mov rsi, text2	; file descriptor
	mov rdx, 7	; file size
	syscall
	ret
	
_printName:
	mov rax, 1	; calling STDOUT
	mov rdi, 1
	mov rsi, name	; file descriptor
	mov rdx, 16	; file size
	syscall
	ret
	
	

