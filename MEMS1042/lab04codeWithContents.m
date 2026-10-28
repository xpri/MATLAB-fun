clear all, close all;

[y, Fs] = audioread('WithContentsTrimmed.wav');
figure(1)
plot(y)
grid

N = 8000;
y2 = 20 * log10(abs(y(1700:N) + 1e-5));
figure(2)
plot(y2)
grid

% RT20 is when the line crosses (yintercept-20)
% RT20a = value / sampling rate (Fs)
% RT60 = 3*RT20a

%in this case RT20 is -14.77-20=-34.77 The value corresponding to that is
%3236.7
RT20a = 3236.7 / Fs;
RT60 = 3*RT20a

f_low  = 177;
f_high = 355;

Wn = [f_low, f_high] / (Fs / 2);
[b, a] = butter(2, Wn, 'bandpass');
y_filtered = filtfilt(b, a, y);
figure(3)
plot(y_filtered)
grid