clc
clear all
close all


a = 0;   
b = 50;

[xvect, xdif, fx, it_cnt] = secant(@compute_impedance,a,b,1e-12);