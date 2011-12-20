import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;
import std.string;

int fact(int n)
{
    if (n <= 1) 
        return 1;
    else
        return n * fact(n - 1);
}

enum int[10] FACT = [fact(0), fact(1), fact(2), fact(3), fact(4),
                     fact(5), fact(6), fact(7), fact(8), fact(9)];
    

bool isCurious(int n)
{
    assert(n > 2);
    int sum = 0;
    foreach(char c; to!string(n))
    {
        sum += FACT[c - '0'];
    }
    
    return n == sum;
}

void main(string[])
{
    int res = 0;
    for (int i = 3; i < 100000; ++i)
    {
        if (isCurious(i))
            res += i;
    }
    
}
