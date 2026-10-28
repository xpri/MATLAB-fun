% Resetrandom number generator for consistency
rng("default");

Fs = 10000; %Hz
period = 1/Fs;
t = 0:period:10;

% Deterministic signals
y1 = 0.2*sin(2*pi*200*t);
y2 = 0.5*sin(2*pi*300*t + 60/360*2*pi);

% figure;
% plot(t,y1,t,y2);

noise = 2*randn(size(t));

% figure;
% plot (t,noise);


%% Nasty signal

signal = y1 + noise;
plot (t,signal);

% Making it play sound!
playback = signal./max(abs(signal));

% playerobj = audioplayer(playback,Fs); %
% play(playerobj)

%% Power Spectral analysis

nfft = 2^12;
noverlap = nfft/2;

pwelch(signal,nfft,noverlap,nfft,Fs);