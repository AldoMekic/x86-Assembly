
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small
.STACK 100h
.DATA
    array DW 100, 200, 300, 400, 500, 600, 700
    indexArray DW 0, 1, 2, 3, 4, 5, 6  
    sumStr DB 10 DUP('$') 

.CODE
Start:
    mov ax, @DATA       
    mov ds, ax

    xor cx, cx          
    lea bx, indexArray  
    xor ax, ax         

sum_loop:
    mov dx, [bx]        
    test dx, 1          
    jnz skip_addition   

    shl dx, 1           
    mov si, dx         
    add ax, [array + si]

skip_addition:
    add bx, 2           
    inc cx              
    cmp cx, 7           
    jl sum_loop         

  
    lea di, sumStr + 9 
    mov [di], '$'       
    dec di              

convert_to_string:
    xor dx, dx         
    mov bx, 10          
    div bx              
    add dl, '0'         
    mov [di], dl        
    dec di              
    test ax, ax        
    jnz convert_to_string

    inc di              

  
    mov ah, 09h         
    lea dx, di          
    int 21h           

  
    mov ax, 4C00h       
    int 21h
END Start

ret




