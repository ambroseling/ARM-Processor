.define LED_ADDRESS 0x10
.define SW_ADDRESS 0x30

MAIN:
    mv r0,#_COUNTER  //counter 1 value
    ld r0,[r0]
	mv r1,#_SPEED  //counter 1 value
    ld r1,[r1]
    mv r6,#0  //counter LED 
	mv r5,#0
	
LOOP:
	add r6,#1
	mvt   r3, #LED_ADDRESS
	st r6,[r3]
 

CONTINUE:
	mvt r4,#SW_ADDRESS
	ld r4,[r4]
	mv r5,r4
	b WAIT_3


	
WAIT_3:
	mv r3,#_COUNTER  //counter 1 value
    ld r0,[r3]
	b WAIT_1
WAIT_1:
	mv r3,#_SPEED  //counter 1 value
    ld r1,[r3]
	b WAIT_2
WAIT_2:
	sub r1,#1
	bpl WAIT_2
    sub r0,#1
    bpl WAIT_1
	sub r5,#1
	bpl WAIT_3
    bmi LOOP

END: b END

_STARTING:   .word   0x01ff
_SPEED_INDEX:.word   0
_COUNTER:    .word   30000 
_SPEED:      .word   65000
