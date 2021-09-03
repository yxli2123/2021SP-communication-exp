clear all;
close all;

mu = 2.4;
sigma = 0.2;
R = chol(sigma);
z = repmat(mu, 3, 4) + randn(3, 4)*R;