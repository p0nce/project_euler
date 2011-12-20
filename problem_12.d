import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

bool divisible(ulong a, ulong b)
{
    return (a % b) == 0;
}

int divisors(ulong n)
{
    ulong[] x = primeFactors(n);
    int res = 1;
    
    for (int i = 0; i < x.length; ++i)
    {
        int possibilities = 2;
        ulong factor = x[i];
        while(i + 1 < x.length && x[i + 1] == factor)
        {
            ++possibilities;
            ++i;   
        }
        res *= possibilities;        
    }
    writefln("%s => %s", n, x);
    return res;
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

void main(string[])
{
    ulong b = 1;
    
    for (int i = 2; true; ++i)
    {
        b += i;
    
        if (divisors(b) > 500)
            break;
    }
    
    writefln("%s", b);
}