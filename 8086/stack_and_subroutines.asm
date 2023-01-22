
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
            ; stack offset in memory is given by SS register
push 0xffff ; pushes 0xffff in stack, and hence stack pointer(sp) grows downwards
pop ax      ; pops the latest value in stack, and stores it in ax...meanwhile value in sp goes back up

;stacks in intel srchitectures store bits in little Endian format, i.e. bits are stores in flipped order. 0103----(stored as)----> 0301
 
push 0xfff4

_main:
    call _test      ; calls the sub routine _test and stores the current program counter address in stack  
    mov ah, 0x20  
    ret  
      
_test: 
    mov ah, 0x10
    ret             ; return to the callers address which is stored in stack
ret




