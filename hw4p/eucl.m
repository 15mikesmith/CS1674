function [dist] = eucl(a, b)
    dist = sqrt(sum(power(a-b, 2)));