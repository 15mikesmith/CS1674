function [ val ] = fib( n )
if n < 2
    val = n;
    return
else
    val = fib(n-1) + fib(n-2);
    return 
end

end