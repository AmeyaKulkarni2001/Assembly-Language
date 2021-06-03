org 0000h
clr P0.7       ; Clear P0.7 to enable Scope connected through DAC
MOV IE, #88h   ; Activate global enable and timer1 enable 1000 1000
Mov TMOD,#10h  ; Select Timer 1 in Mode 1   0001 0000  
Mov TL1,#0FAh   ; Load lower part of timer count value  FFFAH
Mov TH1,#0FFh   ; Load upper part of timer  count value 
Setb 8Eh      ; Run the timer1 i.e. set TR1 / TCON.6      8F 8E 8D 8C  8B 8A 89 88  
Here:
SJMP Here      ; Wait for timer rollover i.e. TF1=1  / TCON.7 = 1
org 001bH      ; Vector location of Timer 1 ISR 
CLR 8Eh       ; Stop timer 1 by making TR1 = 0 i.e. TCON.6 =0
CLR 8Fh       ; Clear TF1 i.e. TF1 = 0 /TCON.7 = 0
CPL A           ; Complement A to send value 00 and FF on port 1 alternatively 
MOV P1, A
Mov TL1,#0FAh      ; Reload timer1 lower count value
Mov TH1,#0FFh     ; Reload timer1 upper count value
Setb 8Eh         ; Start timer by making TR1=1 / TCON.6 = 1  
RETI     ; Return from interrupt to main program
