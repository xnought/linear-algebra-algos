% QR DECOMPOSITION
% running time: O(2n^2(m-n/3)) ~ O(mn^2)
function [Q, R] = their_qr(A)
    [m, n] = size(A);
    Q = eye(m);

    % iterate over each column going down a pivot
    for i = 1:n
        % column starting from pivot
        x = A(i:m, i);

        e_i = eye(m - i + 1, 1); % canonical unit vector [1, 0, ..., 0]^T
        v = x + sign(x) .* norm(x, 2) .* e_i; % x +- ||x||e_i
        v = v / sqrt(v' * v); % norm to 1

        % House holder reflections
        for j = 1:n
            x = A(i:n, j);
            A(i:n, j) = x - (2 * v * v' * x);
        end

        for j = 1:m
            x = Q(i:m, j);
            Q(i:m, j) = x - (2 * v * v' * x);
        end

    end

    Q = Q'; % when Q^-1 = Q^* and so forth
    R = triu(A); % take the upper triangular entries
end
