%Input
prompt = 'specify waveform type (Sine, Square, Sawtooth):   ';
wave = input(prompt,'s');
n = 1;

%Parasitic Values for waverforms tested at different DC biasing levels
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

    % External caps
    C1 = 1e-12;
    C2 = 1e-12;
    Ccm = 1e-12;

%We will now step through different noise voltage levels and test response
for vn = 0.04:0.04:0.2

    %Set preliminary data for computing the response 
    vnstr = num2str(vn);
    if strcmp(wave,'Sine')
        wave_info = strcat(vnstr,'*sin(2.*pi.*433e6.*t)');
        fundamental_f = 433e6;
        % para Q: Number Of the Fourier frenquencies
        Q = 1;
        Method = 2;
        slope = 1.6375e9;
    elseif strcmp(wave,'Square')
        wave_info = strcat(vnstr,'*square(2.*pi.*100e6.*t)');
        fundamental_f = 100e6;
        % para Q: Number Of the Fourier frenquencies
        Q = 50;
        Method = 3;
        slope = 2.12e9;
    elseif strcmp(wave,'Sawtooth')
        wave_info = strcat(vnstr,'*sawtooth(2.*pi.*350.8772e6.*t)');
        fundamental_f = 350.8772e6;
        % para Q: Number Of the Fourier frenquencies
        Q = 50;
        Method = 3;
        slope = 2.32778e9;
    else 
        fprintf("Please enter valid wave type -- (Sine, Square, Sawtooth)")
        return
    end

    %Compute fourier coefficients based on fundamental freq and the wave
	[freq,coeff,APspec] = fourier_coeff(wave_info,0,1./fundamental_f,Q,1000,Method,0,5);
    
    %Initialize empty jitter variables
	Jr = 0;
    Jrn=0;
    Jrp=0;
    Jrn1=0;
    Jrp1=0;
    Jr1p=0;
    Jr1 = 0;
    Jr_l = 0;
    Jr1_l = 0;

%For each fourier coefficient we will analyze the gain of the transfer
%function
    for i=1:Q
        
        vn0 = abs(coeff(Q+i+1));
        %Evaluate transfer function at the ith freq component of the noise
        [Transfer_ff,x,Transfer_ff_l,x_l] = EvalTF(freq(i+1),vn0,Y,Ron_p,Cds_p,Cgd2,Cgs3,Cds2,Cds3,Ron3,ro2,Cgd3,Cgs2,gm2,C1,C2,Ccm);
        
        %Can't divide by 0 if coefficient vn0 = 0 as in square wave coeffs
        if vn0 ~= 0
            %compute differential gain from return vector of stamp
            out1(i) = ((abs(x(5)-x(3)))/vn0);
            out1_l(i) = ((abs(x_l(5)-x_l(3)))/vn0);
        else 
            out1(i) = 0;
            out1_l(i) = 0;
        end
        
        out2 = abs(Transfer_ff);
        out2_l = abs(Transfer_ff_l);
        
        %CLOSED LOOP HYPOTHETICAL MAX (caused from delay/distortion) --
        %this method is al
        Jr = Jr + ((out2 * vn0)/ (slope) - (out2 * -vn0)/ (slope));
        Jr_l = Jr_l + ((out2_l * vn0)/ (slope) - (out2_l * -vn0)/ (slope));
        %Jrp = Jrp + ((out2 * vn0)/ (slope));
        %Jrn = Jrn + (out2 * -vn0)/ (slope);
        
        %MATRICES -- THIS METHOD IS HYPOTEHTICAL MAX, because the peaks
        %cannot align since components are in phase
        %Jr1 = Jr1 + ((out1 * vni)/ (slope) - (out1 * -vn0)/ (slope));
        %Jr1_l = Jr1_l + ((out1_l * vni)/ (slope) - (out1_l * -vn0)/ (slope));
        %Jrp1 = Jrp1 + ((out1 * vn0)/ (slope));
        %Jrn1 = Jrn1 + (out1 * -vn0)/ (slope);
        
        
        
    end

    %Jr = Jrp - Jrn;
    %Jr1 = Jrp1 - Jrn1;
    outa(n) = Jr;
    %outb(n) = Jr1;
    outd(n) = Jr_l;
    %oute(n) = Jr1_l;
    vinpk(n) = vn;
    
    %Algorithm plotting
    [outc(n),outb(n),oute(n)] = EstPSIJ(vn,wave,out1,out1_l);
	n = n + 1;
end

%plot(vinpk,outa(1:5),strcat('red','-x'), vinpk,outb(1:5),strcat('blue','-o'), vinpk,outc(1:5),strcat('green','-x'))
subplot(3,1,1);
plot(vinpk,outa(1:5),strcat('blue','-x'),vinpk,outd(1:5),strcat('red','-x'))
legend('transfer function','TF with L','Location','northeast')
title('closed loop Maximum HYPOTHETICAL jitter '); xlabel('Vn (pk-pk) mV'); ylabel('PSIJ (pk) SEC')   
grid on

%Closed loop
subplot(3,1,2);
plot(vinpk,outc(1:5),strcat('green','-o'))
legend('transfer function','Location','northeast')
title('Closed loop form solutions'); xlabel('Vn (pk-pk) mV'); ylabel('PSIJ (pk) SEC')
grid on


%Matrices
subplot(3,1,3)
plot(vinpk,outb(1:5),strcat('blue','-o'),vinpk,oute(1:5),strcat('red','-o'))
title('computation using matrices -- analytical solution)'); xlabel('Vn (pk-pk) mV'); ylabel('PSIJ (pk) SEC')
legend('nodal matrices','matrices with L','Location','northeast')
grid on

% subplot(3,1,1);
% plot(vinpk,outd(1:5),strcat('red','-x'))
% legend('transfer function','Location','northeast')
% title('closed loop Maximum theoretical jitter with inductor'); xlabel('Vn (pk-pk) mV'); ylabel('PSIJ (pk) SEC')   
% grid on
% 
% subplot(3,1,3)
% plot(vinpk,oute(1:5),strcat('blue','-o'))
% title('computation using matrices -- analytical solution with inductor)'); xlabel('Vn (pk-pk) mV'); ylabel('PSIJ (pk) SEC')
% legend('nodal matrices','Location','northeast')
% grid on


%; 0 -Y Ye Y 0 0 ; 0 0 -Y Yf -Y 0 ; 0 0 0 -Y Yg -Y ; -(Yc + gm2) 0 0 0 -Y Yh]
function [Transfer_fresult,x,Transfer_fresult_l,x_l ] = EvalTF(freq,vnx,Y,Ron_p,Cds_p,Cgd2,Cgs3,Cds2,Cds3,Ron3,ro2,Cgd3,Cgs2,gm2,C1,C2,Ccm)
    
    omega=2*pi*freq;
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
	
	Transfer_fresult=((B3+B4)/(B2*B3-B1*B4));
    
    %Nodal Matrices
	A_1 = [Yb -Ya 0 0 0 -Yc];
	B_2 = [-Ya Yd -Y 0 0 0];
	C_3 = [0 -Y Ye -Y 0 0];
	D_4 = [0 0 -Y Yf -Y 0];
	E_5 = [0 0 0 -Y Yg -Y];
	F_6 = [-Yc-gm2 0 0 0 -Y Yh];
	M = [A_1;B_2;C_3;D_4;E_5;F_6];
	b = [vnx*Y1;0; 0; 0; 0; 0];	
	x = (M\b);
    
    %With inductor
    
    B1_l = (1/Y1)*((Yc*Yg/Y)+(Y/Yf)*((Yb*Ydp/Ya)-(Ya+Yc)));
	B2_l = (1/Y1)*((Ya*Ye/Y)+(Y/Yf)*(Yb*Ydp/Ya-(Ya+Yc))-Yb*((Ydp*Ye)/(Ya*Y)-(Y/Ya)));
	B3_l = Y-((Yg*Yh/Y)+(Y/Yf)*((Yc+gm2)*(Ydp/Ya)-Yh));
	B4_l = (Yc+gm2)*(((Ydp*Ye)/(Ya*Y))-Y/Ya-((Y*Ydp)/(Ya*Yf)));
	
    Transfer_fresult_l=((B3_l+B4_l)/(B2_l*B3_l-B1_l*B4_l));
    
    A_1_l = [Yb -Ya 0 0 0 -Yc];
	B_2_l = [-Ya Ydp -Y 0 0 0];
	C_3_l = [0 -Y Ye -Y 0 0];
	D_4_l = [0 0 -Y Yf -Y 0];
	E_5_l = [0 0 0 -Y Yg -Y];
	F_6_l = [-Yc-gm2 0 0 0 -Y Yh];
	M_l = [A_1_l;B_2_l;C_3_l;D_4_l;E_5_l;F_6_l];
	b_l = [vnx*Y1;0; 0; 0; 0; 0];	
	x_l = (M_l\b_l);
	
end