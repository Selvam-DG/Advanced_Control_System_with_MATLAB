% Lab  - Introductio  to Matlab
% Control Engineering in MATAB 
% Name : Selvam Dasari Gnanaprakash
% Date : 02-November-2023%%%% 

%

% Transfer Function (TF) can be defined in 2 ways
%1 st method : g(s) = tf([coeff coeff],[coeff,coeff,coeff]) 
% 2nd method : g(s) = numerator/denominator

%% Gs = tf([1],[1,2]) % defined transfer function in 1st method
G(s) = 2/(s+2) % defined transfer function in 2nd method
%% 1) "series"    Generates a series connection of two input/output models.
G1 = tf([2],[1,2])
G2 = tf([1],[1,1])
M = series(G1,G2) % M = series(M1,M2) connects the input/ouput models M1 and M2 in series.
                   %  The output of the new LTI system M is the signal y2, the input is u1
%%  2) "parallel"    Generates a parallel connection of two input/output models.
% M = parallel(M1,M2) connects the input/output models M1 and M2 in parallel (y = y1 + y2).

P = parallel(G1,G2)
%% 3) "feedback"    Generates a feedback connection of two input/output models.
% M = feedback(M1,M2) computes a closed-loop model M for this feedback loop such that y = M * u.
%Negative feedback is assumed and the model M maps u to y.
% To apply positive feedback, use the syntax M = feedback(M1,M2,+1)
% If you have a feedback loop with M1 only (i.e. no system M2 in your block diagram) use 
% M = feedback(M1, 1) to calculate the feedback loop!

F = feedback(G1,G2)
%% 3) Some basic calculations for the control loop (e.g. poles,...).
%====================================================
 
% step( sys )                  -  computes the response of LTI system sys to a step input
% bode( sys )                  -  computes the bode plot of LTI system sys
% pzmap( sys )                 -  computes the pole-zero-map of LTI system sys
% dcgain( sys )                -  computes the steady-state gain of LTI system sys

%% Problems:
%1) Compute the LTI system of the closed feedback loop (name: sys_cl)

 %          u --->O---->[ Gs ]----+---> y
 %                |               |           
 %                +-------<-------+

 %  for negative feedback and Gs = (s+1) / (s^2 + 2*s+2) as defined earlier in the Command Window.
% 2) Plot the step response of your system sys_CL. Is the system stable?
% 3) Check for stability by use of the pole-zero-map again!

T1 = tf([1,1],[1,2,2])

sys_cl = feedback(T1,1)

step(sys_cl)
figure
pzmap(sys_cl)

