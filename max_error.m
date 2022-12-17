function error = max_error(actual, approx)
	% calculates the largest error between axtual and approx
	diff = approx - actual;
	error = max(abs(diff));
end