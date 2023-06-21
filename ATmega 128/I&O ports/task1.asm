;Программа для решения логического уравнения (-B2)=А7+(-А4)+А1*А0
;Входы: 7, /4, 1. 0
;Выход: /2
.include "m128def.inc"
.def B2=r20 
.def A7=r21 
.def A4=r22
.def A1=r23
.def A0=r24

.cseg
.org 0

begin:
ldi r16,low(RAMEND)
out spl,r16
ldi r16,high(RAMEND)
out sph,r16

ldi r16,0b00000100
out DDRB,r16
ldi r16,0b00000000
out PINA,r16

main:
rcall input

mov r16,A7
com A4
andi A4,0b00000001
or r16,A4

or r16,A1

eor r16,A0

com r16

subi r16, 0xFF
lsl r16
lsl r16
out PORTB,r16
rjmp main

input:
in r16,PINA
mov A7,r16
mov A4,r16
mov A1,r16
mov A0,r16
andi A7,0b10000000
andi A4,0b00010000
andi A1,0b00000010
andi A0,0b00000001  
lsr A7
lsr A7
lsr A7
lsr A7
lsr A7
lsr A7
lsr A7
lsr A4
lsr A4
lsr A4
lsr A1
ret
