function [PSIJ,PSIJg,PSIJg_l] = EstPSIJ(ampl,wave,gain1,gain1_l)

fprintf('Testing ');
disp(wave)
fprintf(' with amplitude of %.2f V\n',ampl);

ampl_string = num2str(ampl);
%Define the different possible functions

if strcmp(wave,'Sine')
    wave_info = strcat(ampl_string,'*sin(2.*pi.*433e6.*t)');
    fundamental_f = 433e6;
    % para Q: Number Of the Fourier frenquencies
    Q = 1;
elseif strcmp(wave,'Square')
    wave_info = strcat(ampl_string,'*square(2.*pi.*100e6.*t)');
    fundamental_f = 101e6;
    % para Q: Number Of the Fourier frenquencies
    Q = 50;
elseif strcmp(wave,'Sawtooth')
    wave_info = strcat(ampl_string,'*sawtooth(2.*pi.*350.8772e6.*t)');
    fundamental_f = 350.8772e6;
    % para Q: Number Of the Fourier frenquencies
    Q = 50;
else 
    fprintf('Please enter valid wave type')
end

%Define initial vars

% para N: Number of bits
N = 1000;

% para Fd: Freq of PRBS
Fd = 100E6;
% define symbol functions

syms t; %declare symbolic variables

if strcmp(wave,'Sine')
    vr = (99.2e-3)/(13.8e-12)* t - 362.296;
    %slope = 7.18841e9
elseif strcmp(wave,'Sawtooth') %18.6ps on rising edge in hspice
    vr = (31.5e-3/23.5e-12)* t - 67.557;
    %slope = 1.34043e9
elseif strcmp(wave,'Square')
    vr = (99.2e-3)/(13.8e-12)* t - 362.296;
    %slope = 7.18841e9
end

% Caculate the slope, period and intersection

tm0 = solve(vr == 0, t);
alpha = double(diff(vr, t));


Td = 1 / Fd;
% Loop for PSIJ calculation

Jr = zeros(N, 1);

%Calculate all Fourier Series coefficients
[freq,coeff,~] = fourier_coeff(wave_info,0,1./fundamental_f,Q,1000,3,0,5);
for k = 1:N
    %next possible time of the rising edge of PRBS
    tmk = double(tm0 + (k - 1) * Td);
    
    JrkiArray = zeros(Q, 1);
    JrkiArray_Gain = zeros(Q, 1);
    JrkiArray_Gain_inductor = zeros(Q, 1);

    %calculate the jitter from each individual frequency component and sum
    %to determine the total jitter 
    for i = 1:Q
        %Amplitude of the current Fourier frequency (sine wave component)
        Fourier_amp = (coeff(i+Q+1));
        %Compute the amplitude of the freq component at time tmk
        Vni = (Fourier_amp) * sin(2 * pi * freq(i+1) * tmk);
        %Evaluate C.L T.F at freq of interest
        ResFVal = (Transfer_f(freq(i+1),wave));

        %Jitter calculation - divided noise output response by rising slope
        JrkiArray(i) = (Vni * abs(ResFVal))/ alpha;
        JrkiArray_Gain(i) = (Vni * gain1(i))/ alpha;
        JrkiArray_Gain_inductor(i) = (Vni * gain1_l(i))/ alpha;
        
        
    end
   
    %add jitter for all freq component
    Jrk = sum(JrkiArray);
    Jrkg = sum(JrkiArray_Gain);
    Jrkg_l = sum(JrkiArray_Gain_inductor);
   
    %determine if the deviation is before/after rising edge
    JrkPhase = phase(Jrk);
    if JrkPhase <= 0
        Jr(k) = -abs(Jrk);
    else
        Jr(k) = abs(Jrk);
    end
    
    JrkPhase = phase(Jrkg);
    if JrkPhase <= 0
        Jrg(k) = -abs(Jrkg);
    else
        Jrg(k) = abs(Jrkg);
    end
    
    JrkPhase = phase(Jrkg_l);
    if JrkPhase <= 0
        Jrg_l(k) = -abs(Jrkg_l);
    else
        Jrg_l(k) = abs(Jrk);
    end
    
end


%determine the peak-peak jitter
Jmax = max(Jr);
Jmin = min(Jr);

Jmaxg = max(Jrg);
Jming = min(Jrg);

Jmaxg_l = max(Jrg_l);
Jming_l = min(Jrg_l);

PSIJ = Jmax - Jmin;
PSIJg = Jmaxg - Jming;
PSIJg_l = Jmaxg_l - Jming_l;

end
