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

static assert(!isPrime(4));
static assert(isPrime(2));
static assert(isPrime(3));

void main(string[])
{
    ulong primCount = 0;
    ulong n = 2;
    while(true)
    {
        if (isPrime(n))
        {
            primCount ++;   
            writefln("%s is the %s prime", n, primCount);
            
            if (primCount == 10001)
                break;
        }
        
        n++;        
    }    
}


