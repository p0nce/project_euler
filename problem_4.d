import std.stdio;
import std.math;
import std.algorithm;
import std.conv;

bool isPalindrome(string s)
{
    for(int i = 0; i < s.length/2; ++i)
    {
        if (s[i] != s[s.length - 1 - i])
        return false;
    }
    return true;
}

// Find the largest palindrome made from the product of two 3-digit numbers.
void main(string[])
{
    ulong max = 0;
    for (ulong a = 100; a <= 999; ++a)
        for (ulong b = 100; b <= 999; ++b)
        {
            auto m = a * b;
            string s = to!string(m);
            
            if (isPalindrome(s))
                if (m > max)
                {
                    max = m;   
                }
        }
    writefln("%s", max);
}


