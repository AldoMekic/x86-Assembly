
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small 
.DATA 
.STACK 
.CODE 
Start: 
    mov ax, @DATA 
    mov ds, ax 
    mov cx, 0 
    ponovo: 
        cmp cx, 10 
        jge kraj 
        mov dl, '3' 
        mov ah, 02h 
        int 21h 
        inc cx 
        jmp ponovo 
    kraj: 
        mov ax, 4c00h 
        int 21h 
END Start

ret




