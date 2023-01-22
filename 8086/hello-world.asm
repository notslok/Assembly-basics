
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

jmp main        ; jump to main

message: 
    db 'Hello World!', 0

print:
    mov ah, 0eh ;moving print char routine of bios to ah register
._loop:
    lodsb       ; loads a character at a time from si register to al register while incrementing si by 1 unit each time
    cmp al, 0   ; comparing if value at al register is null(i.e. EOF)
    je .done    ; if yes then jump to .done
    int 10h     ; if no call display interrupt from bios to display current character
    jmp ._loop  ; if no jump back to loop
.done:
    ret         ; return the control to origin
 
main:
    mov si, message
    call print
ret             ; return the control to origin




