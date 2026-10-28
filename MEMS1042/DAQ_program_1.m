clear all
close all

filename = 'Square_pos2_3.mat';

fs=5000;
rec_time=8; % seconds

s=daq.createSession('ni');
[ch,idx]=s.addAnalogInputChannel('dev4','ai0','Voltage');

ch(1).Range=[-10 10];
s.Rate=fs;
%s.NumberOfScans=N;
s.DurationInSeconds=rec_time;

listen=s.addlistener('DataAvailable',@(s,event) plot(event.TimeStamps,event.Data));
[data,t]=s.startForeground();

plot(t,data); xlabel('Time (s)'); ylabel('Voltage (V)');

save(filename);
