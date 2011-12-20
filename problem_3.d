import std.stdio;
import std.math;
import std.algorithm;

bool divisible(ulong a, ulong b)
{
    return (a % b) == 0;
}

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

ulong largestPrimeFactor(ulong n)
{
    auto factors = primeFactors(n);
    //foreach (d; div)
    //    writefln("%s", d);
        
    return sort!("a > b")(factors)[0];
}


// By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
void main(string[])
{
    //writefln("%s", largestPrimeFactor(13195));
    writefln("%s", largestPrimeFactor(600851475143));
}


