
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ah, 0eh   ; moving the address of output routine to register ah
mov al, 'A'   ; copying the hex value corresponding to char 'A'
int 0x00      ; calling the itterupt stored at the address 0000:0x00 of the interrupt table
; interrupts table stores the address of 256 interrupt routines starting from address 0000:00x0 in RAM

; // second exercise

push ds       ; push data segment to stack

mov ax, 0
mov ds, ax    ; setting offset to 0
mov [0x00], handle_int0     ; putting the address of handle_int0  to the interrupt table entry corresponding to 0x00 from offset
mov [0x02], cs      ; getting program offset from code segment and putting it in interrupt table index corresponding to offset value of interrupt at 0x00

int 0x00        ; now, unlike before...it will simply call handle_int0

pop ds        ; pop and retreive data segment from stack
ret        


handle_int0:
    mov ah, 0eh
    mov al, 'B'
    int 0x10
    iret        ; return from interrupt




