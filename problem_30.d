import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;
import std.string;

bool isSumOfDigitsPow5(int n)
{
    assert(n >= 0);
    string s = to!string(n);
     
    int sum = 0;
    for(int i = 0; i < s.length; ++i)
    {
        assert(s[i] >= '0');
        assert(s[i] <= '9');
        int c = cast(int)(s[i] - '0');
        sum += c ^^ 5;
    }
    return sum == n;
}

void main(string[])
{
    int sum = 0;
    for (int n = 2; n < 1000000; ++n)
    {
        if(isSumOfDigitsPow5(n))
        {
            writefln("%s", n);
            sum += n;
        }
    } 
    writefln("sum = %s", sum);
}
