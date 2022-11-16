function [h, p, ci] = ttestfruit(sample1, sample2)

    [h, p, ci, stats] = ttest2(sample1, sample2)

	sample1stats = [ mean(sample1) var(sample1)];
	sample2stats = [ mean(sample2) var(sample2)];

	disp("Ripe fruit are normally distributed as")
	disp("X ~ N")
	disp(sample1stats)

	
	disp("Overripe fruit are normally distributed as")
	disp("Y ~ N")
	disp(sample2stats)

	
	if h
		disp("Reject H0! Samples are different :^)")
	else
		disp("Do not Reject H0! Result inconclusive >:o")
	end

	disp("95% CI for difference of mean between ripe and overripe fruit: ")
	disp(ci)
end
