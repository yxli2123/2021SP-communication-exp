clear all;
close all;

N = 12;
M = 7;
n = 0 : 23;
for m = 1:M
    x = sin(2*pi*m*n/N);
    subplot(M, 4, 2*m-1);
    p = plot(x);
    title("Plot N=12, M=" + m);
    axis([0 25 -1 1]);
    xlabel('n');ylabel('x[n]');

    subplot(M, 4, 2*m);
    s = stem(n, x);
    title("Stem N=12, M=" + m);
    axis([0 25 -1 1]);
    xlabel('n');ylabel('x[n]');
end


