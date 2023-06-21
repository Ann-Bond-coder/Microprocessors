.include "m128def.inc"

begin:
ldi r16,low(RAMEND)
out spl,r16
ldi r16,high(RAMEND)
out sph,r16
ldi r16,(1<<6) | (1<<7)
out DDRD,r16

loop:
ldi r20, 3
 RD6:
  ldi r16,(1<<6) 
  out PORTD,r16
  loopDelay:
   rcall delay 
   dec r19
  brne loopDelay
 ldi r16,(0<<6) 
 out PORTD,r16
 ldi r19, 2
 loopDelay2:
  rcall delay
  dec r19
 brne loopDelay2
 dec r20
 brne RD6
ldi r20,3
 RD7:
  ldi r16,(1<<7)  
  out PORTD,r16
  ldi r19, 4
  loopDelay3:
   rcall delay
   dec r19
  brne loopDelay3
  ldi r16,(0<<7) 
  out PORTD,r16
  ldi r19, 4
  loopDelay4:
    rcall delay
    dec r19
  brne loopDelay4
  dec r20
brne RD7
rjmp loop 
delay:
ldi r16,1 
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
