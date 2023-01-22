
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;mov al, 11
mov al, 10
cmp al, 10  ; sets zf flag to 1 if compare matches

;ja _equal  ; jumps if (cf == 0) && (zf == 0)...i.e. first operand is above the second operand(as set by CMP instruction)
;ja _equal  ; jumps if (cf == 1)...i.e. first operand is below the second operand(as set by CMP instruction)
;jae _equal  ; jumps if (cf == 0)...i.e. first operand is above or equal to the second operand(as set by CMP instruction)
;jne _equal ; behave in opp. manner of je i.e if zf--0 it will jump
je _equal   ; if zf flag is set to 1 it jumps to _equal 

jmp _exit

_equal:
    mov ah, 0eh     ;0eh is routine that prints one character on screen
    mov al, 'A'
    int 0x10       ; calling display interrupt
_exit:

ret                  ; returns control to os




