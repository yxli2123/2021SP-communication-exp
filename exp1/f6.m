clear all;
close all;

N = [10, 20, 50, 100];
for i=1:4
    T = 1;
    fs = 1/T;
    N_sample = 128;%为了画波形，设置每个周期的采样点数
    dt = 1/ N_sample;%时间分辨率
    t = 0:dt:10*T-dt;%取 10 个周期
    n = -N(i):N(i);
    Fn = 0.5 * sinc(n/2).*exp(-1j*n*pi/2);%求傅立叶系数
    ft = zeros(size(t));
    for m = -N(i):N(i) %一共 2N+1 项累加。
        ft = ft + Fn(m+N(i)+1) * exp(1j*2*pi*m*fs*t);
    end
    subplot(4, 1, i);
    plot(t, ft);
    title("n=" + N(i));
    xlabel("t")
    ylabel("S(t)")
end
