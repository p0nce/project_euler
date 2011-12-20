import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

bool divisible(ulong a, ulong b)
{
    return (a % b) == 0;
}

ulong[] divisors(ulong n)
{
    auto pf = primeFactors(n);

    ulong[] res = [1u];

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

T sum(T)(T[] x)
{
    T r = 0;
    foreach(e; x)
        r += e;
    return r;
}

bool isAmicableNumber(ulong u)
{
    ulong sod = sum(divisors(u));
    bool res = (u != sod) && (u == sum(divisors(sod)));

    if (res)
        writefln("%s and %s are an amicable pair", u, sod);
    return res;
}

void main(string[])
{
    ulong sum = 0;
    for (int i = 2; i < 10000; ++i)
    {
        if (isAmicableNumber(i)) sum += i;
    }
    writefln("sum = %s", sum); // 31626
}
