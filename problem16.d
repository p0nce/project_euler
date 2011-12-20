import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

void sumDigits(int n)
{    
    
    BigInt r = BigInt(2) ^^ n;
    string s = toDecimalString(r);
    writefln("%s", s);

    int sum = 0;
    foreach(char c; s)
        sum += (c - '0');

    writefln("sum of digits = %d", sum);
}


void main(string[])
{
    sumDigits(15);    // 26
    sumDigits(1000); // 1366
}
