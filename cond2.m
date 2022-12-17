function cond_number = cond2(A)
    S = svd(A, "econ");
    [m, n] = size(S);
    sigma_1 = S(1, 1);
    sigma_r = S(m, n);
    cond_number = sigma_1 / sigma_r;
end
