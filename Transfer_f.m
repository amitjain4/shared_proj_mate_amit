function Transfer_f = Transfer_f(f,wave)

%2.0V VDD and 0.4V SUP
if strcmp(wave,'Sine')
    Y = 1/50;
    Ron_p = 44.95;
    Cds_p = 196.8061e-15;
    Cgd2 = 23.4052e-15;
    Cds2 = 94.9907e-15;
    Cgs2 = 104.4758e-15;
    gm2 = 18.3618e-3;
    ro2 = 1/gm2;
    Ron3 = 15.107;
    Cgs3 = 86.9028e-15;
    Cds3 = 183.7823e-15;
    Cgd3 = 81.0317e-15;
elseif strcmp(wave,'Sawtooth') %18.6ps on rising edge in hspice
    Y = 1/50;
    Ron_p = 75.739;
    Cds_p = 195.9636e-15;
    Cgd2 = 19.2048e-15;
    Cds2 = 83.3662e-15;
    Cgs2 = 100.3848e-15;
    gm2 = 13.7369e-3;
    ro2 = 1/gm2;
    Ron3 = 28.15;
    Cgs3 = 85.5391e-15;
    Cds3 = 181.4708e-15;
    Cgd3 = 78.1194e-15;
elseif strcmp(wave,'Square')
    Y = 1/50;
    Ron_p = 44.95;
    Cds_p = 196.8061e-15;
    Cgd2 = 23.4052e-15;
    Cds2 = 94.9907e-15;
    Cgs2 = 104.4758e-15;
    gm2 = 18.3618e-3;
    ro2 = 1/gm2;
    Ron3 = 15.107;
    Cgs3 = 86.9028e-15;
    Cds3 = 183.7823e-15;
    Cgd3 = 81.0317e-15;
end
omega = 2*pi*f;

% External caps
C1 = 1e-12;
C2 = 1e-12;
Ccm = 1e-12;


% Transfer Function Calculations

	Y1 = (1+1j*omega*Ron_p*Cds_p)/Ron_p;
	Y2 = 1j*omega*(Cgd2+Cgs3);
	Y3 = (1+1j*omega*Ron3*Cds3)/Ron3;
	Y4 = (1+1j*omega*ro2*Cds2)/ro2;
	
    L = 10e-9;
    Yl = 1/(1j*omega*L);
	Ya = 1j*omega*Cgd3;
	Yc = 1j*omega*Cgs2;
	Yb = Y1+Y2+Ya+Yc;
	Yd = Y3+Y+Ya;
	Ye = 2*Y+1j*omega*C2;
	Yf = 2*Y+1j*omega*Ccm;
	Yg = 2*Y+1j*omega*C1;
	Yh = gm2+Y4+Y+Yc;
    %Yu = Y4 + Y + Yc; 
    Yp = (Y3*Yl)/(Y3+Yl);
    Ydp = Yp+Y+Ya; 
	
	B1 = (1/Y1)*((Yc*Yg/Y)+(Y/Yf)*((Yb*Yd/Ya)-(Ya+Yc)));
	B2 = (1/Y1)*((Ya*Ye/Y)+(Y/Yf)*(Yb*Yd/Ya-(Ya+Yc))-Yb*((Yd*Ye)/(Ya*Y)-(Y/Ya)));
	B3 = Y-((Yg*Yh/Y)+(Y/Yf)*((Yc+gm2)*(Yd/Ya)-Yh));
	B4 = (Yc+gm2)*(((Yd*Ye)/(Ya*Y))-Y/Ya-((Y*Yd)/(Ya*Yf)));
	
	Transfer_f=((B3+B4)/(B2*B3-B1*B4));

end


