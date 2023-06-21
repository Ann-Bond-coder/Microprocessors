.include "m128def.inc"

begin:
ldi r16,low(RAMEND)
out spl,r16
ldi r16,high(RAMEND)
out sph,r16
ldi r16,(1<<6) | (1<<7)
out DDRD,r16

loop:
ldi r16,(1<<6) 
out PORTD,r16
rcall delay 
ldi r16,(1<<7) 
out PORTD,r16
rcall delay 
rjmp loop 
delay:
ldi r16,3 
delay1:
ldi r17,2 
delay2:
ldi r18,2
delay3:
dec r18
brne delay3
dec r17
brne delay2
dec r16
brne delay1
ret
