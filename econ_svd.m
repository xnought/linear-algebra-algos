function [U, S, V] = econ_svd(A)
    % A = U*S*V'
    % a rotation a stretch and another rotation
    % U is sorted
    [m, n] = size(A);

    if m > n
        % long skinny matrix
        % A' = (U*S*V')' = V*S*U'
        % A'*A = V*S^2*V'
        [V, S_2] = eig(A' * A);
        S = sqrt(S_2);

        [r, r] = size(S);
        U = zeros(m, r);

        for j = 1:r
            U(j) = (A * V(j)) / S(j, j)
        end

    else
        % short fat matrix (or square)
        [U, S_2] = eig(A * A');
        S = sqrt(S_2);

        [r, r] = size(S);
        V = zeros(r, n);

        for j = 1:r
            V(j) = (A' * U(j)) / S(j, j)
        end

    end

end
