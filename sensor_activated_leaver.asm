;port 1 for sensing, driving motors and for indicator led
;p 1.8 and p 1.7 are used to determine the positopn of the leaver
;-----p1.8--p1.7----meaning 
;-------0-----0-----indicator nither aligned left or right
;-------1-----0-----indicator aligned left
;-------0-----1-----indicator aligned right
;-------1-----1-----indicator aligned both left and right no possiable something went wrong

;-------------------startup blinking------------


		MOV A,#2H
		
START:	MOV P1,#0C0H
		LCALL DELAY
		MOV P1,#0C1H
		LCALL DELAY
		DJNZ A,START
;----------------------------------------------------

;-------------Main program starts-------------------

		;-------------setting initial positions sensing left or right delay for program to wait till you adjust ----------------

		MOV C,P1.8;Sensing left alignment
		LCALL DELAY
		LCALL DELAY
		JC HITLEFT
		MOV C,P1.7;Sensing right alignment
		LCALL DELAY
		LCALL DELAY
		JC HITRIGHT
		;------------------------------------------------------
		
		
		
HITLEFT: LJMP HALFDELAY
		 MOV P1,#0C9H; The leaver stats moving leftward hit
		 NOP
		 MOV C,P1.8
		 JC HITRIGHT
		 SJMP HITLEFT
		 
		 
		 
HITRIGHT: LJMP HALFDELAY
		 MOV P1,#0C4H; The leaver stats moving leftward hit
		 NOP
		 MOV C,P1.8
		 JC HITLEFT
		 SJMP HITRIGHT
		
		 
HALFDELAY:
		 



DELAY: