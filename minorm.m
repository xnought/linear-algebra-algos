% Ax = b
% honestly i could just do x = pinv(A)*b given that the same is going on
function x = minorm(A, b)
    % do svd: A = USV^*
    [U, S, V] = svd(A, "econ");

    % pseudo invert A^-1 = VS^-1U^*
    U_star = U';
    S_inv = pinv(S);
    A_pseudo_inv = V * S_inv * U_star;

    % solve A^-1(A)x = Ix = A^-1(b)
    x = A_pseudo_inv * b;
end
