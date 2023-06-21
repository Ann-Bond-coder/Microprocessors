.model tiny
.code
org 100h
start:  mov ax,13h
        int 10h
        push 0A000h
        pop es

	mov al,6Eh
        mov di,100*320+160
        mov si,1
        mov cx,20

a1:     push cx
        mov cx,si
        rep stosb
        add di,319
        sub di,si
        add si,2
        pop cx
        loop a1

        mov al,0Fh
        mov di,100*320+160
        mov si,1
        mov cx,20

a2:     push cx
        mov cx,si
        rep stosb
        add di,320
        sub di,si
        add si,1
        pop cx
        loop a2

	mov al,0Ah
        mov di,110*320+160
        mov si,1
        mov cx,10

a3:     push cx
        mov cx,si
        rep stosb
        add di,318
        sub di,si
        add si,4
        pop cx
        loop a3


        mov ah,0
        int 16h
        mov ax,3
        int 10h
        ret
end start
