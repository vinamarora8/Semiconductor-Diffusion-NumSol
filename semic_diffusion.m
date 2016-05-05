(* ::Package:: *)

tmax = 10^-14;
delX = 5*10^-10;
rangeX = 5*10^-7;

% The value at which one wants to calculate excess charge career
% concentration.
tmax = 10^-12;

% The infinitesimally small time element.
delT = tmax/10000;

Dp = 1.2432*10^-3;

% Range of width axis.
rangeX = 5*10^-6;

% The infinitesimally small width element.
delX = 5*10^-10;
Dp = 12432*10^-7;

% for tmax = 10^-15s : delX = 5*10^-10, rangeX = 5*10^-8
% for tmax = 10^-14s : delX = 5*10^-10, rangeX = 5*10^-7
% for tmax = 10^-13s : delX = 5*10^-10, rangeX = 5*10^-7
% for tmax = 10^-12s : delX = 5*10^-10, rangeX = 5*10^-6
% for tmax = 10^-11s : delX = 5*10^-10, rangeX = 5*10^-6
% for tmax = 10^-10s : delX = 5*10^-10, rangeX = 5*10^-5
% for tmax = 10^-09s : delX = 10*10^-10, rangeX = 5*10^-4
% for tmax = 10^-08s : delX = 10*10^-10, rangeX = 5*10^-4

% Number of blocks created on the width axis.
elements = int16(rangeX/delX);

% initialization of excess charge career distribution at t=0.
p = zeros(1, 2 + elements);
p(int16(elements/2)) = 10^20;
p(1 + int16(elements/2)) = 10^20;

% temporary array to store the career concentration at t+deltat.
temp = zeros(1, 2 + elements);
x = [-int16(elements/2):1:1+int16(elements/2)];


% Width axis array.
x = [1:1:2 + elements];

% Number of blocks created on the time axis.
iterations = tmax/delT;

for t = 0:iterations
    for i = 2:(elements+1)
        temp(i) = p(i) + (delT*Dp/(delX^2))*(p(i+1) - 2*p(i) + p(i-1));
    end
    p = temp;
end

plot(x,p)
