clear all;
close all;


T=1;
N_sample=128;%为了画波形，设置每个周期的采样点数
dt=1/ N_sample;%时间分辨率
t=0:dt:T-dt;
st=[ones(1, N_sample/2), zeros(1, N_sample/2)];%依据 T 将信号离散化 
subplot(311);
plot(t,st);
axis([0 1 0 1]);
xlabel('t');
ylabel('s(t)'); 
subplot(312) ;
[f,sf]=T2F(t,st) ;
plot(f,abs(sf)) ;hold on ;%画出 sf 的幅度谱，不含相位
axis([-10 10 0 1]);
xlabel('f');ylabel('|S(f)|');
sff=0.5*sinc(f/2) .* exp(0.5i*pi*f);%依据傅里叶变换求%信 号频谱
plot(f,abs(sff),'r-')
[t,st]= F2T (f,sf);%进行离散傅立叶反变换，求原始信号
subplot(313) ;
plot(t,st)
axis([0 1 0 1]);
xlabel('t');ylabel('restored s(t)');


function [f,sf] = T2F(t,st)%该子函数需要两个参数 t 和 st。
%t—离散时间;st—离散信号
T=t(end) ;
df=1/T ;%频率分辨率
N=length(st) ;%离散傅立叶变换长度
f=-N/2*df :df :N/2*df-df ;%设定频谱区间，注意要关于原点对称，共有 N 个点，包括 0 点，% 故要减去一个 df
sf=fft(st);
sf=T/N*fftshift(sf);%信号的频谱与离散傅立叶变换之间的关系，fftshift(x)是将信 号%的频谱 x 进行移位，与原点对称。
end


function [t,st]= F2T (f,sf)
%f 离散的频率;sf—信号的频谱
df=f(2)-f(1) ; %频率分辨率
Fmx=f(end)-f(1)+df ;%频率区间长度
dt=1/Fmx ; %已知频率区间长度时，求时间分辨率，由前面频率分辨率公式△f=df=1/T， %T=dt*N，得到△f=df=1/ (dt*N)，故 dt=1/(df*N)=1/Fmx，即时间分辨率
N=length(sf) ;
T=dt*N; %信号持续时间
t=0:dt:T-dt;
%离散傅立叶反变换，是 T2F 的逆过程
sff=fftshift(sf); %把对称的频谱进行平移，平移后同 T2F 中的 sf
st=Fmx*ifft(sff);
end
