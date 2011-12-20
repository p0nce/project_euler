import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

void main(string[])
{
    BigInt a = 1;
    BigInt b = 1;    
    int num = 0;
    while (true)
    {       
        num ++;
    //    writefln("%s: %s", num, a);
        
        if (toDecimalString(a).length >= 1000)
        {
            writefln("%s", num);
            return;
        }
        
        BigInt c = a + b;
        a = b;
        b = c;
    }
}
