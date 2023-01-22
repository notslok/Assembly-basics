
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

jmp main

message:    db 'Hello World!', 0

print:
    mov ah, 0eh           ; 0eh----> output one character   
._loop:
    lodsb                 ; read one cahr from si to al
    cmp al, 0             ; compare if char stored in al in prev. step is qual to null(0) or not
    je .done
    int 10h               ; 10h--->video screen routine
    jmp ._loop
.done:
    ret
main:
    mov si, message       ; go to address given at reg. si to see the stored message content
    call print
    ret 




