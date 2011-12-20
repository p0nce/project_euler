import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;


bool divisible(T)(T a, T b)
{
    assert(b != 0);
    return (a % b) == 0;
}

T[] primeFactors(T)(T n)
{   
    assert(n > 0);
    for (T x = 2; x * x <= n; ++ x)
        if (divisible!T(n, x))
            return [x] ~ primeFactors(n / x);
    return [n];
}

T[] divisors(T)(T n) // return proper divisors
{
    assert(n > 0);
    auto pf = primeFactors(n);

    T[] res = [1];

    for (int i = 0; i < pf.length; ++i)
    {
        auto cpy = res.dup;
        foreach(ref c; cpy)
            c *= pf[i];

        res = res ~ cpy;
    }

    // remove duplicates and n
    {
        int i = 0;
        while (i < res.length - 1)
        {
            bool isDup = false;
            for (int j = i + 1; j < res.length; ++j)
                if (res[i] == res[j])
                {
                    isDup = true;
                    break;
                }
            if (isDup)
            {
                res = res[0..i] ~ res[i+1..$]; // remove 
            } else ++i;
        }
    }

    // remove n
    res = res[0..$-1];
    return res;
}

bool isPrime(T)(T x)
{
    return divisors(x).length == 1;
}

void main(string[])
{
    for (int a = -1000; a <= 1000; ++a)
    for (int b = -1000; b <= 1000; ++b)
    {
        int fun(int n)
        {
            return n*n + a * n + b;
        }
        
        int n = 0;
        while(true)
        {
            int u = fun(n);
            if (u < 1)
                break;
            if (!isPrime(u))
                break;
         
            n++;
        };
        if (n >= 20)
            writefln("a = %s b = %s  n = %s", a, b, n);
    }
}
