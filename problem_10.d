import std.stdio;
import std.math;
import std.algorithm;
import std.conv;

bool divisible(ulong a, ulong b)
{
    return (a % b) == 0;
}


// What is the 10001st prime number?

ulong[] primeFactors(ulong n)
{    
    //writefln("divisors(%s)", n);
    
    for (ulong x = 2; x * x <= n; ++ x)
    {
        if (divisible(n, x))
        {
            //writefln("divisible by %s", x);
            return [x] ~ primeFactors(n / x);
        }
    }
    
    return [n];
}



bool isPrime(ulong n)
{
    return (primeFactors(n).length == 1);
}

ulong sumOfPrimesBelow(ulong M)
{
    ulong sum = 0;
    for (ulong n = 2; n < M; ++n)
    {
        if (isPrime(n))
            sum += n;
    }
    return sum;
}

void main(string[])
{
    writefln("%s", sumOfPrimesBelow(2000000));
}


