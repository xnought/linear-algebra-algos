function x = tikhonov_solve(A, b, regularize)
    [m, n] = size(A);
    I = eye(n);
    A = [A; regularize * I];
    b = [b; zeros(n, 1)];
    x = A \ b;
    x = x(1:n);
end
