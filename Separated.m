% File name: PhasorAnimation.m
% Author: CHAN Yun Sang, Ethan; CHAN Ho Kwan, Tony; SIU Pui Yin, Benji
% Department of Electrical Engineering, The Hong Kong Polytechnic
% University
% Email: ethan.ys.chan@connect.polyu.hk
% Demonstration program: Phasor and space vector

clear all
close all
clc

% SETUP ===================================================================
% all physical quantities in S.I. units unless stated otherwise
                             
% Voltage
A = 10;                     % Amplitude of the AC Voltage
B= 5;                       % Amplitude of the AC Current
T = 20;                      % Period of the AC signal
w = 2*pi/T;                  % Angular speed of the AC phasor
N = 400;                   % Number of frames for animation; smaller the value, the more triagular the sinewave will be
t = linspace(0,3*T,N);              % time increment
v  = A .* sin(2*pi*t/T);     % Mathmatic function of the AC Waveform
phase_diff=0;              % phase difference between voltage and current
yPP = B .* sin(2*pi*t/T-phase_diff);

%vP = A .* cos(2*pi*t/T);   % Use this if you want a Cosine Waveform

% GRAPHICS ================================================================
figure(1)
%   Setup for plot window
set(gcf,'units','normalized'); 
set(gcf,'position',[0.1 0.1 0.6 0.30]);
set(gcf,'Color',[1 1 1]);
set(gca,'FontSize',12);

% circle
p = linspace(0,2*pi,500);
xc = A .* cos(p);  % Horizontal Parameter of Circle_Voltage
yc = A .* sin(p);  % Vertical Parameter of Circle_Voltage
xcc = B .* cos(p);  %Horizontal Parameter of Circle_Current
ycc = B .* sin(p); % Vertical Parameter of Circle_Current

for a = 1 : N 
for c = 1 : N
    hold off
   axis off
 %Circle Voltage

   subplot(1,2,1);
   plot([0 A*cos(w*t(c))],[0 A*sin(w*t(c))],'lineWidth',3,'Color',[0 0 1]); % Tracking line of circle (Blue)
  
   hold on

   xP = [A*cos(w*t(c)) A*cos(w*t(c))]; yP = [A*sin(w*t(c)) 0]; % Horizontal Component of Circle (red tracking line)
   plot(xP,yP,'r','LineWidth',3) 

   plot(xc,yc,'m','lineWidth',1);  % Perimeter of circle

   xP = [0 0]; yP = [-A A]; % Background vertical coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);

   xP = [-A A]; yP = [0 0];  % Background horizontal coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);

 %Circle Current
   plot([0 B*cos(w*t(c)-phase_diff)],[0 B*sin(w*t(c)-phase_diff)],'lineWidth',3,'Color',[0 1 0]); % Tracking line of circle (Yellow)

   xP = [B*cos(w*t(c)-phase_diff) B*cos(w*t(c)-phase_diff)]; yP = [B*sin(w*t(c)-phase_diff) 0]; % Horizontal Component of Circle (black tracking line)
   plot(xP,yP,'k','LineWidth',3) 

   plot(xcc,ycc,'y','lineWidth',2);  % Perimeter of circle
   
hold off
set(gca,'FontSize',12);
axis equal
axis on

  % Sin wave Voltage 
  subplot(1,2,2);
  
   % plot([-A 72],[A*sin(w*t(c)) A*sin(w*t(c))],'lineWidth',1,'Color',[0 1 1]); % Reference line (cyan-blue) 
   xP = [t(c) t(c)]; yP = [0 v(c)];% Vertical component of sin wave (red trcking line)
   plot(xP,yP,'r','LineWidth',3);
   
    hold on
   xP = [0 t(end)]; yP = [0 0]; %Background horizontal axis of sin wave, [start point, end point]
   plot(xP,yP,'k','LineWidth',1);
   xlabel('t/seconds')
   ylabel('amplitude')
         
   xP = t; yP = v; % Background sin wave (pink)
   plot(xP,yP,'m','LineWidth',1); 
   
   xP = t(1:c); yP = v(1:c); % Horizontal component of sin wave (blue trcking line)
   plot(xP,yP,'b','LineWidth',3); 
      

% Sin wave Current  
   % plot([-B 72],[B*sin(w*t(c)-phase_diff) B*sin(w*t(c)-phase_diff)],'lineWidth',1,'Color',[1 0 0]); % Reference line (red horizontal line)
  
   xP = [t(c) t(c)]; yP = [0 yPP(c)];% Vertical component of sin wave (red trcking line)
   plot(xP,yP,'k','LineWidth',3);
      
   xP = t;  % Background sin wave (pink)
   plot(xP,yPP,'y','LineWidth',1); 
   
   xP = t(1:c); yP = yPP(1:c); % Horizontal component of sin wave (green trcking line)
   plot(xP,yP,'g','LineWidth',3);  

   hold off
   set(gca,'FontSize',12);

   axis on
   pause(0.01) % Delay 

end
end