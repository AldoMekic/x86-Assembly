
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small
.STACK 100h
.DATA
    array DW 1, 2, 3
    sum   DB 0           

.CODE
Start:
    mov ax, @DATA       
    mov ds, ax

    
    mov cx, 3           
    mov bx, 0           
    mov ax, 0           

sum_loop:
    add ax, [array + bx] 
    add bx, 2            
    loop sum_loop        

    
    add ax, '0'         

    
    mov dl, al          
    mov ah, 02h
    int 21h

    
    mov ax, 4C00h
    int 21h
END Start

ret




