function [tA, tb] = tikhonov(A, b, mu)
    [m, n] = size(A);
    regularizer = eye(n) * mu;
    zs = zeros(n, 1);

    tA = [A; regularizer];
    tb = [b; zs];
end
