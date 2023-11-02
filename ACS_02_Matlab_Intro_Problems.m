% ACS - Problems on general Matlab programming for Control Engineering in
% the course.
%
%
% Prof. F.A. King
% TH Rosenheim
% 08.08.2022
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
% right click the cell and choose "Run section".
%
% In general a Matlab cell/section starts at "%%" and ends at the beginning 
% of the next cell.
%
% To evaluate the whole file (!) you can use the "Run button" 
% (Matlab GUI: EDITOR -> Run) or press <F5>.
%
% 
% To supress errors the variable "dummyValue = 0" is introduced. Please
% delete and fill in your solutions at this position!




%% Creating matrices 
%  Often in the field of control of state-space systems we have to define
%  matrices and / or vectors in Matlab e.g. the dynamic matrix A of our
%  state-space system.
%
%  Replace the 'dummyValue' with your solution!
%
%  Evaluate the current cell by "Ctrl + Enter"
%  and check your solution in the Command Window!

%  Please generate the matrix A of the following form
%           1 0 0 0 0
%           0 1 0 0 0
%           0 0 1 0 0
%           0 0 0 2 0
%           0 0 0 0 2
%  1) by use of the command diag([.,.,.,...]) (-> variable name: A1).
%  2) just by use of the commands ones, eye, zeros, * (= multiplication) and [.] (-> A2).
%     Please note the special structur consisting of four sub blocks of this matrix!
%
clear all %clears the current work space, do not change!
dummyValue = 0;% please do not change this line

% 1) Delete the expression "dummyValue" in the line below and type in your 
%    solution there.
%    Test your solution by evaluating this cell by "Ctrl + Enter" - you
%    will get the result of your line of code in the Command Window.
A1 = diag([1,1,1,2,2])

% 2) See above... your solution for part 2):

A2 = [eye(3,3) zeros(3,2); zeros(2,3) (2.*(eye(2,2)))]


%% Variable editor "Workspace" in the Matlab GUI
% 1) Check in the Workspace Window that A1, A2 are current variables.
% 2) Double click one of them and check the values.

% --> see the Workspace!

%% Transformations of state-space systems and Matrix Calculations
% Let us assume that we have a state-space system with dynamic 
% matrix A and input vector b.
%
%  For each of the following parts 1 to 4:
%  ---------------------------------------
%  - Replace the 'dummyValue' with your solution!
%  - Evaluate the current cell by "Ctrl + Enter"
%    and check your solution in the Command Window!

% 1) Define the variables A and T (transformation matrix) for the 
%    following matrices
%          1 2 3           -1  2  2
%    A:    1 7 3        T: -1  3  4
%          1 3 2            1  1  1
%
%    and the vector b for the input vector / vector x0 for the 
%    IC (initial condition)
%        1             10
%    b:  1        x0:  8
%        2             1
%
%
% 2) Compute the solution x0_tilde of the matrix-vector equation 
%    x0 = T * x0_tilde    
%    and check your result!
%
% 3) Compute the matrices/vectors A_tilde, b_tilde of the transformed
%    state-space representation for the state transform x = T * x_tilde!
%
%    Hint: From the lecture we already know 
%          A_tilde = T^-1 * A * T
%          b_tilde = T^-1 * b
%
% 4) Compute the so-called matrix exponential expm(A*t) for t = 0 and
%    t = 2.25 and afterwards the corresponding eigenvalues of these.
dummyValue = 0;% Do not change this line.

% 1) Your solution for the first part.
%    As always: Delete the expression "dummyValue" and replace it with your solution.
%    Test your solution by evaluating this cell by "Ctrl + Enter" - you
%    will get the result of your line of code in the Command Window.    
A = [ 1 2 3; 1 7 3; 1 3 2];
T = [-1 2 2; -1 3 4; 1 1 1]
b = [1;1;2]
x0 = [10;8;1]


% 2) Your Solution - replace "dummyValue" with your solution an evaluate
%    cell by "Ctrl + Enter":
x0_tilde = inv(T)*x0
%%
% 3) Your Solution - replace "dummyValue" with your solution an evaluate
%    cell by "Ctrl + Enter":
A_tilde = T^-1 * A * T
b_tilde = T^-1 * b


% 4) Your Solution - replace "dummyValue" with your solution an evaluate
%    cell by "Ctrl + Enter":
matExp_t0 = expm(A*0); 
matExp_t225 = expm(A*2.25);

% Eigenvalues of the two previous matrices:
eigMatExp_t0 = eig(matExp_t0);
eigMatExp_t225 = eig(matExp_t225);


%% A bit of Simple Signal "Processing" 
% From an experiment you have the following measurement data signals:
% control loop output y(t),
% desired value signal w(t).
% These two signals are included (as time series) in the vectors yVec and wVec.
%
clear all
dummyValue = 0;% Do not change this line.
tVec = [0:0.01:60]'; % vector containing values of related sample times in [sec]
%
% Please load the measurement data included in the Matlab mat-file 
% "ACS_Lab1_myData.mat" by use of the following Matlab statement:
load ACS_Lab1_myData.mat
whos
%% Check Availability of the Measurement Data
% Check in the Matlab Workspace that the three vectors 
% tVec - sample time values of measured data
% yVec - measured output data of the control loop
% wVec - desired values for the control variable
% are there! 
% Mind the dimensions of the vectors!


%% Plot Output Signal y
% To analyze the control loop performance we have to compare the output y 
% to the desired values w included in wVec. 
% Plot the signal y over time t at first:
figure % do not remove!
%
% Your plot command:
plot(tVec,yVec)
xlabel("sample time values of measured data")
ylabel("measured output data of the control loop")

%% Plot Desired Values w for the Output y
% Plot the signal w over time t now:
figure % do not remove!
%
% Your plot command:
plot(tVec,wVec)
xlabel("sample time values of measured data")
ylabel("desired values for the control variable")


%% Compare the Output Signal with the Desired Values
% Is the output y of the control loop following its desired values?
plot(tVec,yVec, "r-")
hold on
plot(tVec,wVec,"b--")
hold off
xlabel("sample time values of measured data")

%% Tracking Error of the Control Loop
% To evaluate the tracking performance typically we are not comparing y and w 
% directly in the graphics but we calculate the tracking error signal e(t)
% at first: e(t) = w(t)-y(t)
% 
% Calculate the vector containing the tracking error here:
eVec = wVec - yVec;

%% Plot of the Tracking Error e
figure % do not remove
%
% Add a further plot statement here to visualize the tracking error eVec
% over time tVec here:
plot(tVec,eVec)


% Is the tracking error e(t) decreasing or increasing over time? What does
% that mean for the performance of the control system?


