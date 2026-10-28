clear all, close all;

[y, Fs] = audioread('ContentsRemoved.wav');
figure(1)
plot(y)
grid

N = 175000;
y2 = 20 * log10(abs(y(163500:N) + 1e-5));
figure(2)
plot(y2)
grid


% RT20 is when the line crosses (yintercept-20)
% RT20a = value / sampling rate (Fs)
% RT60 = 3*RT20a

%in this case RT20 is -14.67-20=-34.67 The value corresponding to that is
%5465.38
RT20a = 5465.38 / Fs;
RT60 = 3*RT20a


f_low  = 177;
f_high = 355;

Wn = [f_low, f_high] / (Fs / 2);
[b, a] = butter(2, Wn, 'bandpass');
y_filtered = filtfilt(b, a, y);
figure(3)
plot(y_filtered)
grid