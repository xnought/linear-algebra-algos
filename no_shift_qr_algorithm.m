function evals = no_shift_qr_algorithm(A, iterations)
    [m, n] = size(A);

    for i = 1:iterations
        [Q, R] = qr(A);
        A = R * Q;
    end

    evals = A;
end
