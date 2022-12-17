function T = tridiag(A)
    % Householder vector to first second
    % Apply in both directions (row across)
    % 						   (col across)
    % we don't care about the Q's
    T = A;
    [m, n] = size(T);
    Q = eye(m);

    % iterate over each column going down a pivot
    for i = 2:(n - 1)
        % column starting from pivot
        x = T(i:m, i - 1);

        e_i = eye(m - i + 1, 1); % canonical unit vector [1, 0, ..., 0]^T
        v = x + sign(x) .* norm(x, 2) .* e_i; % x +- ||x||e_i
        v = v / sqrt(v' * v); % norm to 1

        % House holder reflections over the columns
        for j = 1:n
            x = T(i:n, j); % column
            T(i:n, j) = x - (2 * v * (v' * x));
        end

        % House holder reflections over the rows
        for j = 1:m
            x = T(j, i:m); % row
            T(j, i:m) = x - (2 * (x * v) * v');
        end

    end

end
