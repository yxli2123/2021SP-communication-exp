clear all;
close all;

A = randi([0 255], 50, 50, 'uint8');
A(A <= 128) = 0;
A(A > 128) = 1;
