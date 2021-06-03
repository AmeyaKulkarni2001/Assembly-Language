org 0000h
Mov TMOD,#10h                 ; Select Timer 1 in Mode 1
clr P0.7         Clear P0.7 to enable Scope connected through DAC

again:
Mov TH1,#0FFh     ; Load Upper value of Count FF
Mov TL1,#0F0h     ; Load lower value of Count   F0
Setb 8Eh          ; Start Timer by making TR1=1  / TCON.6 =1

Here:
JNB 8Fh, Here     ; Wait till TF1 = 1   /TCON.7 =1

Clr 8Eh          ; Stop Timer1 by making TR1=0  / TCON.6=0
Clr 8Fh          ;  Clear Timer flag i.e. TF1=0 / TCON.7 =0
CPL A           ; Co
