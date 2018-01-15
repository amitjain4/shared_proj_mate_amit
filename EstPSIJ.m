function result = EstPSIJ(ampl,wave)

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
    fundamental_f = 100e6;
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
    vr = ((41e-3)-(-37.6e-3))/((932e-12)-(884e-12))* t - 1.48515;
    %slope = 1.6375e9
elseif strcmp(wave,'Sawtooth') %18.6ps on rising edge in hspice
    vr = ((39.2e-3)-(-44.6e-3))/((853e-12)-(817e-12))* t - 1.9464;
    %slope = 2.32778e9
elseif strcmp(wave,'Square')
    vr = ((40.7e-3)-(-44.1e-3))/((863e-12)-(823e-12))* t - 1.78886;
    %slope = 2.12e9
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
    tmk = double(tm0 + (k - 1) * Td);
    JrkiArray = zeros(Q, 1);
    
    for i = 1:Q
        %Amplitude of the current Fourier frequency (sine wave component)
        Fourier_amp = coeff(1+i+Q);
        Vni = (Fourier_amp) * sin(2 * pi * freq(i+1) * tmk);
        ResFVal = (Transfer_f(freq(i+1),wave));
        JrkiArray(i) = (Vni * ResFVal)/ alpha;
    end

    Jrk = sum(JrkiArray);
    JrkPhase = phase(Jrk);
    if JrkPhase <= 0
        Jr(k) = -abs(Jrk);
    else
        Jr(k) = abs(Jrk);
    end
end

Jmax = max(Jr);
Jmin = min(Jr);
PSIJ = Jmax - Jmin;
result = PSIJ;

end