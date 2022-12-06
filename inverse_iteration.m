function eval = inverse_iteration(A, evec_guess, iterations)
    [m, n] = size(A);
    I = eye(m);
    z = evec_guess / norm(evec_guess);

    % do this by doing inverse iteration (1/ eval - shift) differnce gets big for all other evals
    for i = 1:iterations
        eval_guess = z' * A * z;

        % shift by best eval guess
        z = (A - eval_guess * I) \ z;
        z = z / norm(z);
    end

    eval = z' * A * z;
end
