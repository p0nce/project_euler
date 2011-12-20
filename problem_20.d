import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;


void sumDigits(int n)
{    
    BigInt r = 1;
    for (int i = 1; i <= n; ++i)
        r *= i;

    string s = toDecimalString(r);
    writefln("%s", s);

    int sum = 0;
    foreach(char c; s)
        sum += (c - '0');

    writefln("sum of digits = %d", sum);
}


void main(string[])
{
    sumDigits(10); // 27
    sumDigits(100); // 648
}
