function eval = power_method(A, evec_guess, iterations)
    z = evec_guess / norm(evec_guess);

    for i = 1:iterations
        z = A * z;
        z = z / norm(z);
    end

    eval = z' * A * z;
end
