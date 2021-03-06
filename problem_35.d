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
    assert(x >= 0);
    if (x <= 1) return false;
    if (x <= 3) return true;
    return (divisors(x).length == 1);
}

void findPrimes(bool[] b)
{
    b[] = true;
    b[0] = false;
    b[1] = false;
    for (int i = 2; i < b.length; ++i)
    {
        int k = 2;
        while(k * i < b.length)
        {
            b[k * i] = false;            
            ++k;                 
        }
    }
}

void main(string[])
{
    // primality up to 1000000
    int N = 1000000;
    bool[] prim;
    prim.length = N;
    findPrimes(prim);
    
    bool isCircularPrime(int n)
    {
        string rotate(in string s)
        {
            return s[1..$] ~ s[0..1];
        }
        
        string sn = to!string(n);
        int nrot = sn.length;
        for (int i = 0; i < nrot; ++i)
        {
            if (!prim[to!int(sn)])
                return false;
            sn = rotate(sn);           
        }
        return true;
    }
        
    int count = 0;
    for (int i = 2; i < N; ++i)
    {
        if (isCircularPrime(i))
        {
            ++count;
            writeln(i);
        }
    }
}
