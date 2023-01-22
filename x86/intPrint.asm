; ------------ printing integer of arbitary size -------------------

; --- defining equ values

SYS_EXIT equ 60

; --- defining macros

%macro exit 0
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
%endmacro

%macro print 1
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, 1
	syscall
%endmacro
; ---

section .bss
	digitSpace resb 100
	digitSpacePos resb 8
	
section .text
	global _start

_start:
	mov rax, 123	; moving integer to be printed into rax register
	call _printRAX
	
	exit
	
_printRAX:
	mov rcx, digitSpace		; assigning the first value of digitSpace variable to rcx register
	mov rbx, 10			; as digits are stored in little endian format (reverse order), so inserting newline character in advance
	mov [rcx], rbx			; moving the content of rbx to rcx(i.e. your digitSpace variable)
	inc rcx				; increasing the digitspace pointer
	mov [digitSpacePos], rcx;	; assigning the current digitspace address to digitSpacePos pointer

	
;---------- example procedure for _printRAXLoop ------------
;
;	123/10 = 12 remainder(3) ----> store 3 ... (by default in dl)
;	12/10 = 1 remainder(2) ----> store 2 ... (by default in dl)
;	1/10 = 0 remainder(1) ----> store 1 ... (by default in dl)
;
;-----------------------------------------------------------

_printRAXLoop:
	mov rdx, 0		; initialising register to store final integer
	mov rbx, 10		; moving divisor i.e. 10 to rbx
	div rbx			; ---> rax / rbx and storing in rbx
	push rax		; pushing the value of (rax/rbx) stored in rbx, back to rax register
	add rdx, 48		; converting remainder stored in rdx to ASCII char
	
	mov rcx, [digitSpacePos]	; inserting number in digitSpacePos
	mov [rcx], dl			;
	inc rcx				;
	mov [digitSpacePos], rcx	;	
	
	pop rax
	cmp rax, 0		; compare if quotient is zero yet
	jne _printRAXLoop	; if quotient you are getting is not equal to zero then loop again
	

_printRAXLoop2:
	mov rcx, [digitSpacePos]

	; print -----------------
	;mov rax, 1
	;mov rdi, 1
	;mov rsi, rcx
	;mov rdx, 1
	;syscall
	;------------------------
	; alternatively...
	
	print rcx	; invoking print macro

	
	mov rcx, [digitSpacePos]
	dec rcx
	mov [digitSpacePos], rcx
	
	cmp rcx, digitSpace
	jge _printRAXLoop2
	
	ret
	
	
	


