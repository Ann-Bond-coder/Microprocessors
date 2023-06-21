.model small
.data
    string db 'micr'
.code
WriteSTR PROC
    mov ax, @data
    mov ds, ax

    mov ax, 2
    int 10h
    mov ax, 0b800h
    mov es, ax

    mov di, 0
    mov si, offset string	  ;ініціалізує вихідний індексний регістр (SI) зі зміщенням змінної "string"
    mov cx, 4			          ;ініціалізація лічильника
    mov ah, 02h 		        ;Атрибут кольору

lp_out:
    mov bx, 4             	;Зміна на кількість символів для виводу(внутрішній цикл)
    lp_in:
        lodsb             	;Завантаження в al чергового символа (al ←ds:si)
        stosw 	            ;Вигрузка “символ + атрибут” з ах у відеобуфер(ax→es:di)
        dec bx              ;Зменшення лічильника
        jnz lp_in
    mov si, offset string	  ;ініціалізує вихідний індексний регістр (SI) зі зміщенням змінної "string"
    dec di    
    add di, 165
    dec cx
    jnz lp_out

    mov ah, 10h
    int 16h

    mov ah, 4ch
    int 21h
WriteSTR ENDP
end
