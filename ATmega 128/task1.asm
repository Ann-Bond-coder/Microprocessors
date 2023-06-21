.include "m128def.inc"

begin:
ldi r16,low(RAMEND)
out spl,r16
ldi r16,high(RAMEND)
out sph,r16

ldi r16, 255
out DDRD,r16

loop:
rcall printB
rcall delay
rcall printA
rcall delay
rcall printK
rcall delay
rcall printE
rcall delay
rcall printD
rcall delay
rjmp loop 


printB:  ;01100010
ldi r16, 98
out PORTD,r16
ret

printA:  ;01100001
ldi r16, 97
out PORTD,r16
ret

printK:  ;01101011
ldi r16, 107
out PORTD,r16
ret

printE:  ;01100101
ldi r16, 101
out PORTD,r16
ret

printD:  ;01100100
ldi r16, 100
out PORTD,r16
ret

delay:
ldi r16,250
dec r16
ret
brne delay
