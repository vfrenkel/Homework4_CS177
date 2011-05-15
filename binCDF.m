function [probability] = binCDF(k,n,p)
%give probability of at most k successes in binomial experiment with n samples and probability p of success.
% Accumulate values of binomial pdfs with number of trials 'n'
% and probability of success for each trial 'p' up to 'k' succcesses.

probability = 0;
for k_c=[0:k]
	%calculate binomialpdf at k_c
	probability += (factorial(n) / (factorial(n - k_c) * factorial(k_c))) * p^k_c * (1 - p)^(n-k_c);
end

