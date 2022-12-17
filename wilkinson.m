function mu = wilkinson(A)
    % 2 x 2 sub matrix called subA
    subA = A(end - 1:end, end - 1:end);
    a = subA(1, 1);
    b = subA(1, 2);
    c = subA(2, 2);
    b2 = b^2;

    % wilkinson shift
    del = (a - c) / 2;
    mu = c - (sign(del) * b2) / (abs(del) + sqrt(del^2 + b2));
end
