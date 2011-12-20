import std.stdio;
import std.math;
import std.algorithm;
import std.conv;

// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

void main(string[])
{
    ulong square_of_sum(ulong n)
    {
        ulong res = 0;
        for (ulong i = 1; i <= n; ++i)
        {
            res += i;            
        }
        res = res * res;
        writefln("square_of_sum(%s) = %s", n, res);
        return res;
    }
    
    ulong sum_of_square(ulong n)
    {
        ulong res = 0;
        for (ulong i = 1; i <= n; ++i)
        {
            res += (i * i);            
        }
        writefln("sum_of_square(%s) = %s", n, res);
        return res;
    }
    
    writefln("%s", square_of_sum(100) - sum_of_square(100));
}


