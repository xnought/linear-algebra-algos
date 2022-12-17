function x = normal_solve(A, b)
    A_star_A = A' * A
    A_star_b = A' * b
    x = A_star_A \ A_star_b;
end
