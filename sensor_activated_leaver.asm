;port 1 for sensing, driving motors and for indicator led
;p 1.8 and p 1.7 are used to determine the positopn of the leaver
;-----p1.8--p1.7----meaning 
;-------0-----0-----indicator nither aligned left or right
;-------1-----0-----indicator aligned left
;-------0-----1-----indicator aligned right
;-------1-----1-----indicator aligned both left and right no possiable something went wrong

;-------------------startup blinking------------


		MOV R1,#2H
		
START:	MOV P1,#0C0H
		LCALL DELAY
		MOV P1,#0C1H
		LCALL DELAY
		DJNZ R1,START
		
;----------------------------------------------------

;-------------Main program starts-------------------

		;-------------setting initial positions sensing left or right delay for program to wait till you adjust ----------------

		MOV C,P1.7;Sensing left alignment
		LCALL DELAY
		LCALL DELAY
		JC HITLEFT
		MOV C,P1.6;Sensing right alignment
		LCALL DELAY
		LCALL DELAY
		JC HITRIGHT
		;------------------------------------------------------
		
		
		
HITLEFT: MOV P1,#0C4H
		 LJMP PULSE
		 MOV P1,#0C9H; The leaver stats moving leftward hit
		 NOP
		 MOV C,P1.7
		 JC HITRIGHT
		 SJMP HITLEFT
		 
		 
		 
HITRIGHT:MOV P1,#0C4H
		 LJMP PULSE
		 MOV P1,#0C4H; The leaver stats moving leftward hit
		 NOP
		 MOV C,P1.6
		 JC HITLEFT
		 SJMP HITRIGHT
		
		 
PULSE:	MOV R7,#03H
PUL1:	MOV R6,#0FFH
PUL2:	DJNZ R6,PUL2
		DJNZ R7,PUL1
		RET
		
		 



DELAY:	MOV R7,#08H
DEL1:	MOV R6,#0FFH
DEL2:	MOV R5,#0FFH
DEL3:	DJNZ R5,DEL3
		DJNZ R6,DEL2
		DJNZ R7,DEL1
		RET
	 





