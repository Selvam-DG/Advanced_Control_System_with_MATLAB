% ACS - Problems on analyzing LTI systems given
% as TFs in Matlab for Control Engineering.
%
%
% Prof. F.A. King
% TH Rosenheim
% 02.11.2023
% 
%
%
% Please note:
% ------------
% This file contains several problems which can be solved step by step. 
% Fill in your solution at the defined positions ("dummyValue") and evaluate the active
% cell as described below.
%
% To work on the problems below it is best to evaluate just the 
% active cell (around the curser position, highlighted yellow in the editor!) 
% one by one using "Ctrl + Enter" (German keyboards: "Strg + Enter") or
% right click the cell and choose "evaluate current section".



%% Analyzing LTI Systems Part 1
%
%% A first Exercise for Second Order Systems
%
% Problem
% -------
% Define the following SISO systems in Matlab and
% use the second transfer function method.
% First step: Define variable s once as a TF.
% Second step: Define your TFs afterward.
%
% Evaluate the current cell by "Ctrl + Enter"
% and check your solution in the Command Window!
%
%              3.0  
% G(s) =   ---------------   (variable name Gsys_1)
%           s^2 + 2s + 2
%
% Do NOT change the following lines:
clear all, clc
dummyValue = 0;
% Define variable s as a TF:
s = tf('s');
%
% Define the TF Gsys here:
% Gsys_1 = tf([3],[1,2,2])
 Gsys_1 = 3/(s^2+2*s+2)


%% Steady-State Gain
% 1) What is the steady-state gain of Gsys_1? (Hint: s->0) here frequency
% zero
% 2) Calculate the steady-state gain in Matlab using the command "dcgain"
%    and check your answer for 1)!
steadyStateGain = dcgain(Gsys_1)

%% Pole-Map of a LTI System in Matlab
% Below the system Gsys_2 is defined first.
% Definition of Gsys_2 (do not change the next 3 lines!):
s = tf('s');
Gsys_2 = (3)/(s^2 + 1.25*s + 3)
figure
%
% STEP RESPONSE OF LTI SYSTEMS:
% The response to a unit step at t=0 of an LTI system can be computed 
% by the command "step".
% Compute the step response of system Gsys_2 in the next line:
step(Gsys_2)


% Questions:
% 1) Estimate the frequency of the oscillation (in Hz) from the plot!
% 2) How much overshoot do we have?
% maximum value from graph is 0.3 (check value from steady state
% line(dotted line)

%% Pole-Zero-Map
% Generate the pole map for this system, use the Matlab command 
% "pzmap" (= Pole-Zero-Map) for that!

figure % do not change!
%
% Compute the pzmap in the next line (don´t forget to press Ctrl+Enter):

pzmap(Gsys_2)

% Questions on the pzmap:
% 1) What values do we get for the real and imaginary parts of the poles?
% 0.625+1.62i, -0.625-1.62i
% 2) What is the frequency in rad/sec of the poles? 
%    Hint: "Left click" on one of the poles in the pzmap.
% Ans - 1.73 rad/sec = 1.73/(2*pi)=  0.275Hz 
%    --> Compare this result with your previous result from the step response!
%
% 3) What amount of "overshoot" do these two poles have (in %)?
%    --> Compare to previous results again!