clear all;
close all;

A = zeros(50);
row = 1:50;

for i = 1:50
    A(i) = row;
    row = row + i;
end

B = fliplr(A);
C = flipud(A);
A(1:10, 1:10) = 0;
D = A;