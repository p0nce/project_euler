import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

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

T sum(T)(T[] x)
{
    T r = 0;
    foreach(e; x)
        r += e;
    return r;
}

T sumOfDivisors(T)(T x)
{
    T[] div = divisors(x);
    return sum(div);
}

bool isPerfectNumber(T)(T x)
{
    return sumOfDivisors(x) == x;
}

bool isAbundantNumber(T)(T x)
{
    return sumOfDivisors(x) > x;
}

void main(string[])
{   
    enum N = 28130;
    bool[] abundantsP;
    bool[] sumOfTwoAbundants;
    abundantsP.length = N;
    sumOfTwoAbundants.length = N;
    abundantsP[0] = false;
    for(int i = 1; i < N; ++i)
    {
        abundantsP[i] = isAbundantNumber(i);        
        if (i < 12)
            assert(!abundantsP[i]);
    }
    
    for (int i = 0; i < sumOfTwoAbundants.length;  ++i)
        sumOfTwoAbundants[i] = false;
    
    for (int i = 0; i < sumOfTwoAbundants.length;  ++i)
        if (abundantsP[i])
        for (int j = 0; j < sumOfTwoAbundants.length;  ++j)
        if (abundantsP[j])
        if (i+j < N)
        {
            sumOfTwoAbundants[i+j] = true;
        }
    assert(sumOfTwoAbundants[24]); 
    assert(isPerfectNumber(28));
    
    int sum = 0;
    for (int i = 0; i < sumOfTwoAbundants.length;  ++i)
        if (!sumOfTwoAbundants[i])
            sum += i;
    writeln(sum);
}
