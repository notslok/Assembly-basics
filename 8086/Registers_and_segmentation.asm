
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov [0xff], 0x30 ; stores 0x30 at (memory address given in register ds * 16) + (0xff * 16) 

mov ax, 0x300     ; 8086 instruction set has no way of moving 0x300 (a.k.a an immediate value) directly to ds, so we use an intermediate register
mov ds, ax        ; changing offset value at ds from 0x700 to 0x300
mov [0xff], 0x30  ; stores 0x30 at (memory address given in register ds * 16) + (0xff * 16)

jmp 0x7c0:0xff    ;jumps makes code segment register(cs) = 0x7c0 and program counter(IP register) = 0xff
ret




