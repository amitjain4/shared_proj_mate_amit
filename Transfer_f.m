function Transfer_f = Transfer_f(f,wave)

%2.0V VDD and 0.4V SUP
if strcmp(wave,'Sine')
    Y=1/50;
    f=433e6;
    omega=2*pi*f;
    Ron_p = 222.3057;
    Cds_p = 39.6704e-15;
    Cgd2 = 81.2943e-15;
    Cgs3 = 85.9043e-15;
    Cds2 = 186.311e-15;
    Cds3 = 187.5754e-15;
    Ron3 = 14.4434;
    ro2 = 834.5852;
    Cgd3 = 82.1576e-15;
    Cgs2 = 85.3737e-15;
    gm2 = 1.1982e-3;
elseif strcmp(wave,'Sawtooth') %18.6ps on rising edge in hspice
    Y=1/50;
    f=350.8772e6;
    omega=2*pi*f;
    Ron_p = 1129.78;
    Cds_p = 29.4827e-15;
    Cgd2 = 60.0431e-15;
    Cgs3 = 84.6309e-15;
    Cds2 = 159.2961e-15;
    Cds3 = 182.2445e-15;
    Ron3 = 32.159;
    gm2 = 5.6186e-3;
    ro2 = 1/gm2;
    Cgd3 = 78.1192e-15;
    Cgs2 = 60.0431e-15;
elseif strcmp(wave,'Square')
    Y=1/50;
    f=100e6;
    omega=2*pi*f;
    Ron_p = 362.6849;
    Cds_p = 29.8034e-15;
    Cgd2 = 80.9477e-15;
    Cgs3 = 85.7579e-15;
    Cds2 = 185.8152e-15;
    Cds3 = 187.3279e-15;
    Ron3 = 15.1751;
    gm2 = 1.3689e-3;
    ro2 = 1/gm2;
    Cgd3 = 81.9803e-15;
    Cgs2 = 85.2328e-15;
end

% External caps
C1 = 1e-12;
C2 = 1e-12;
Ccm = 1e-12;


% Transfer Function Calculations

Y1 = (1+1j*omega*Ron_p*Cds_p)/Ron_p;
Y2 = 1j*omega*(Cgd2+Cgs3);
Y3 = (1+1j*omega*Ron3*Cds3)/Ron3;
Y4 = (1+1j*omega*ro2*Cds2)/ro2;
	
Ya = 1j*omega*Cgd3;
Yc = 1j*omega*Cgs2;
Yb = Y1+Y2+Ya+Yc;
Yd = Y3+Y+Ya;
Ye = 2*Y+1j*omega*C2;
Yf = 2*Y+1j*omega*Ccm;
Yg = 2*Y+1j*omega*C1;
Yh = gm2+Y4+Y+Yc;
%Yu = Y4 + Y + Yc; 
	
B1 = (1/Y1)*((Yc*Yg/Y)+(Y/Yf)*((Yb*Yd/Ya)-(Ya+Yc)));
B2 = (1/Y1)*((Ya*Ye/Y)+(Y/Yf)*(Yb*Yd/Ya-(Ya+Yc))-Yb*((Yd*Ye)/(Ya*Y)-(Y/Ya)));
B3 = Y-((Yg*Yh/Y)+(Y/Yf)*((Yc+gm2)*(Yd/Ya)-Yh));
B4 = (Yc+gm2)*(((Yd*Ye)/(Ya*Y))-Y/Ya-((Y*Yd)/(Ya*Yf)));
	
Transfer_f=((B3+B4)/(B2*B3-B1*B4));

end


