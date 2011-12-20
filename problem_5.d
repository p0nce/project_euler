import std.stdio;
import std.math;
import std.algorithm;
import std.conv;

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
void main(string[])
{
    bool ok(ulong n)
    {
        for (ulong i = 2; i < 20; ++i)
        {
            if ((n % i) != 0)
                return false;
        }
        return true;
    }
    
    ulong res = 21;
    
    
    while(true)
    {
        if (ok(res))
        {
            writefln("%s", res);
            return;   
        }        
        res++;
    }    
}


