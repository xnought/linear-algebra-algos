function evals = qr_algorithm(A, iterations)
    [m, n] = size(A);
    I = eye(m, n);

    for i = 1:iterations
        % from ./qr_decomposition.m
        shift = A(m, n) .* I;
        [Q, R] = qr(A - shift);

        % to get back to evals from before shift back
        A = (R * Q) + shift;
    end

    evals = A;
end
