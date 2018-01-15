.title Jitter Analysis 
.op
.options list node post
.trans 0.001n 5000n
.option accurate=1 method=gear
.include 'UA741'
$DC Parameter test Voltage
vpu in 0 0
$Square Wave
$vpu in 0  pulse (0 2 0.5n 0.1n 0.1n 4.9n 10n)
$PRBS Signal
$vpu in 0 LFSR (0 2 0.5n 0.5n 0.5n 100meg 1 [5,2] 0)

$VDD SUPPLY
$Sine and Square Wave
vdd posrail 3 2.0
$Sawtooth Wave
$vdd posrail 3 1.2

vss psrail 0 2.0

$NOISE SOURCES
$Sine Wave 
$vn 3 0 sin (0 0.04 433MEG)
$Square Wave
vn 3 0 pulse(-0.1 0.1 0 0.5n 0.5n 4.5n 10n)
$Sawtooth wave
$vn 3 0 pulse(-0.2 0.2 0 2.85n 0 0 2.85n)

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
mnm1 A A1 0 0 nch w=37u l=250n
mpm2 A A1 posrail posrail pch w=100u l=250n

mnm14 A1 psrail in in nch w=37u l=250n
mpm15 A1 0 in in pch w=100u l=250n 

$Buffer
mnm3 B C 0 0 nch w=37u l=250n
mpm4 B C psrail psrail pch w=72u l=250n

mnm12 C in 0 0 nch w=37u l=250n
mpm13 C in psrail psrail pch w=100u l=250n

$mnm3 posrail in B B nch w=36u l=250n
$R7 B 0 100

$ M2 Transistor
mnm7 vsup A e e nch w=72u l=250n

R1 e dn 50
R2 dn f 50

 $M4 Transistor
mnm8 f B 0 0 nch w=72u l=250n

C1 dn 0 1p
R3 dn z 50
C2 z 0 1p
R4 z dp 50
CCM dp 0 1p

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
