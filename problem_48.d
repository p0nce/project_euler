import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

void main(string[])
{
    BigInt sum = 0;
    
    for (ulong i = 1; i <= 1000; ++i)
        sum += i ^^ i;
        
    writefln("%s", sum);
        
}
