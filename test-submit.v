.define HEX_ADDRESS 0x20
.define SW_ADDRESS 0x30
// This program shows a decimal counter on the HEX displays

MAIN:

    mv r6, pc
	mv r4,#0
	mv r0,#0

LOOP:

	mv r0, #_NUMBER
	ld r0,[r0]
	
EXTRACT_DIGITS:
	mv r6,pc
	b DIV10
	mvt r3, #HEX_ADDRESS // point to HEX port
	mv r4,#_HEX_INDEX
	ld r4,[r4]
	add r3,r4
	mv r4,#DATA
	add r4,r0
	ld r4,[r4]
	st r4,[r3]
	mv r4,#_HEX_INDEX
	ld r4,[r4]
	add r4,#1
	mv r3,#_HEX_INDEX
	st r4,[r3]
	mv r0,r1
	add r0,#0
	bne EXTRACT_DIGITS
	mv r5,#1
	b WAIT_3
	
CONTINUE:
    mv r0, #_NUMBER
	ld r0,[r0]
	add r0,#1
	mv r3,#_NUMBER
	st r0,[r3]
    bcc LOOP
    b MAIN


// subroutine DIV10
//      This subroutine divides the number in r0 by 10
//      The algorithm subtracts 10 from r0 until r0 < 10, and keeps count in r1
//      This subroutine also changes r2

// input: r0
// returns: quotient Q in r1, remainder R in r0 


DIV10:
    mv r1, #0 //init Q
    
DLOOP:
    mv r2, #9 //check if r0 is less than 10 yet
    sub r2, r0 
    bcs RETDIV //if so, then return
    
INC:
    add r1, #1 //but if not, then increment Q
    sub r0, #10 //r0 -=10
    b DLOOP //continue loop

RETDIV:
    add r6, #1  //adjust the return address
    mv pc, r6     //return results
   
   
   
// subroutine BLANK: blank the hex display?

BLANK:
	mvt r3, #HEX_ADDRESS // point to HEX port
	mv r4,#_HEX_INDEX
	ld r4,[r4]
	add r3,r4
	mv r4,#0
	st r4,[r3]
	mv r3,#_HEX_INDEX
	ld r4,[r3]
	add r4,#1
	st r4,[r3]
	mv r4,#_HEX_INDEX
	ld r4,[r4]
	sub r4,#5
	bne BLANK
    add    r6, #1
    mv     pc, r6

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
    bmi CONTINUE

END: b END

DATA:
    .word  0b00111111 //0
    .word  0b00000110 //1
    .word  0b01011011 //2
    .word  0b01001111 //3
    .word  0b01100110 //4
    .word  0b01101101 //5
    .word  0b01111101 //6
    .word  0b00000111 //7
    .word  0b01111111 //8
    .word  0b01100111 //9

_HEX_INDEX: .word 0
_COUNTER:    .word   30000 
_SPEED:      .word   65000   
_NUMBER:     .word 0 