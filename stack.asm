
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small 
.DATA 
.STACK 
.CODE 
Start: 
    mov ax, 1212h 
    mov bx, 3434h 
    push ax 
    push bx 
    pop ax 
    pop bx 
    mov ax, 4c00h 
    int 21h 
END Start

ret




