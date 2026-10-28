clear all
clc

%% Use one of the two lines below, depending on file type:
%
load Square_pos2_3.mat; % read in .mat file (Matlab format)
%
% data = load('data_avg_accel.txt'); % read in text file
% 
% fs = 450; % input sampling frequency in Hz (if reading a text file)

time = (1:length(data))*(1/fs); % time vector for plotting (delta-t from sample rate)

% plot audio file data v. time
figure(1)
plot(time,data,'k.-'); 
xlabel('time (sec)','FontSize',16)
ylabel('Signal','FontSize',16)
title('Original Signal (time domain)','FontSize',16)


%% Calculate FFT %%

N = length(data); % Number of data points
d_freq = fs/N; % frequency resolution for fft analysis (dependent on # of samples and sampling frequency)

data_nobias = detrend(data); % remove bias / DC offset (if necessary)

freq = (0:(N-1))*d_freq; % frequency vector for x-axis of the plot

fft_data = 2/N*abs(fft(data_nobias)); % calculate FFT and get magnitude of complex result, scale by 2/N

% get first half of FFT data and frequency vector (the second half of the FFT results is a mirror image of the first half and is typically discarded)
freq_firsthalf = freq(1:floor(N/2)); 
fft_data_firsthalf = fft_data(1:floor(N/2)); 

% plot FFT as a "stem" plot
figure(2)
plot(freq_firsthalf, fft_data_firsthalf,'LineWidth',1)

xlabel('Frequency (Hz)','FontSize',12); 
ylabel('FFT magnitude','FontSize',12);
title('FFT of Signal','FontSize',12)


%% Power Spectral Density (PSD) -- same idea as FFT
%
% figure(3)
% pwelch(data_nobias,[],[],[],Fs)
% title('PSD of data')