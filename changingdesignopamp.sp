$* CONNECTIONS:   NON-INVERTING INPUT
$*                | INVERTING INPUT
$*                | | POSITIVE POWER SUPPLY
$*                | | | NEGATIVE POWER SUPPLY
$*                | | | | OUTPUT
$*                | | | | |
$.SUBCKT UA741    1 2 3 4 5
$*
$  C1   11 12 4.664E-12
$  C2    6  7 20.00E-12
$  DC    5 53 DX
$  DE   54  5 DX
$  DLP  90 91 DX
$  DLN  92 90 DX
$  DP    4  3 DX
$  EGND 99  0 POLY(2) (3,0) (4,0) 0 .5 .5
$  FB    7 99 POLY(5) VB VC VE VLP VLN 0 10.61E6 -10E6 10E6 10E6 -10E6
$  GA 6  0 11 12 137.7E-6
$  GCM 0  6 10 99 2.574E-9
$  IEE  10  4 DC 10.16E-6
$  HLIM 90  0 VLIM 1K
$  Q1   11  2 13 QX
$  Q2   12  1 14 QX
$  R2    6  9 100.0E3
$  RC1   3 11 7.957E3
$  RC2   3 12 7.957E3
$  RE1  13 10 2.740E3
$  RE2  14 10 2.740E3
$  REE  10 99 19.69E6
$  RO1   8  5 150
$  RO2   7 99 150
$  RP    3  4 18.11E3
$  VB    9  0 DC 0
$  VC 3 53 DC 2.600
$  VE   54  4 DC 2.600
$  VLIM  7  8 DC 0
$  VLP  91  0 DC 25
$  VLN   0 92 DC 25
$.MODEL DX D(IS=800.0E-18)
$.MODEL QX NPN(IS=800.0E-18 BF=62.50)
$.ENDS



.title Jitter Analysis 
.op
.options list node post
.trans 0.001n 5000n
.option accurate=1 method=gear
.include 'UA741'
vpu in 0  pulse ( 0.3 2.8 0.5n 0.5n 0.5n 5n 11n)
$VDD SUPPLY
$Sine and Square Wave
vdd posrail 3 2.0
$Sawtooth Wave
$vdd posrail 3 1.2

$NOISE SOURCES
$Sine Wave 
vn 3 0 sin (0 0.1 433MEG)
$Square Wave
$vn 3 0 pulse(-0.1 0.1 0 0.5n 0.5n 4.5n 10n)
$Sawtooth wave
$vn 3 0 pulse(-0.1 0.1 0 2.85n 0 0 2.85n)

$Ideal Vsup @ 0.4V
$vsup 2 0 0.4

$OP AMP
XUA741 Vpos vsup rail nrail VO1 UA741
VNegr nrail 0 -12
Vbias Vpos 0 0.4 
VDD1 rail 0 12

mnm11 posrail VO1 vsup vsup nch w=72u l=250n
C3 vsup 0 180p

$ OP467 SPICE Macro-model
$.SUBCKT OP467 1 2 99 50 27
$.ENDS

$Inverter
mnm1 A in 0 0 nch w=36u l=250n
mpm2 A in posrail posrail pch w=100u l=250n

$Buffer
$mnm3 B A 0 0 nch w=36u l=250n
$mpm4 B A 1 1 pch w=72u l=250n
mnm3 posrail in B B nch w=36u l=250n
R7 B 0 100

$ M2 Transistor
mnm7 vsup A e e nch w=72u l=250n

R1 e dn 50
R2 dn f 50

 $M4 Transistor
mnm8 f B 0 0 nch w=72u l=250n

C1 dn 0 0p
R3 dn z 50
C2 z 0 0p
R4 z dp 50
CCM dp 0 0p

$M1 Transistor
mnm9 vsup B g g nch w=72u l=250n
R5 g dp 50
R6 dp h 50

$M3 Transistor
mnm10 h A 0 0 nch w=72u l=250n
.lib 'mix025_1.l' TT
$.AC LIN 20 100K 1000K
$.options probe
$.probe V(A)
$.PARAM vout = 'dp - dn'
$.PRINT VR(dn) VI(dn) VM(dn) VP(dn)   
$.PRINT VR(dp) VI(dp) VM(dp) VP(dp)
$.PRINT VR(vout)
$.PRINT VR(dp-dn) VI(dp-dn) VM(dp-dn) VP(dp-dn)
$.PRINT AC ZIN(R)
.end
