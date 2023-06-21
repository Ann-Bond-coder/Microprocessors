.include "m128def.inc"
.def A=r20
.def E=r21

.cseg
.org 0

begin:
ldi r16,low(RAMEND)
out spl,r16
ldi r16,high(RAMEND)
out sph,r16

ldi r16,0x00
out DDRD,r16
ldi r16,0x0f
out DDRA,r16
ldi r16,0xf0
out DDRE,r16
ldi r16,0b00001001
out PINA,r16
ldi r16,0b10010000
out PINE,r16

main:
rcall input

eor A, E

out PORTD,A
rjmp main

input:
in A,PINA
in E,PINE
lsr A
lsr A
lsr A
lsr A
lsr E
lsr E
lsr E
lsr E
ret
