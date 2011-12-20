import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

BigInt fact(int n)
{    
    BigInt r = 1;
    for (int i = 2; i <= n; ++i)
    {
        r *= BigInt(i);        
    }
    return r;
}


void main(string[])
{
    writefln("%s", fact(40) / (fact(20) * fact(20)));
}