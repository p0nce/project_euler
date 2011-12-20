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

string binary(int n)
{
    assert(n >= 1);
    string res = "";
    while (n > 0)
    {
        res = (((n & 1) == 0) ? "1" : "0") ~ res;                
        n = n / 2;
    }
    return res;
}

bool isPalindromicB10B2(int n)
{
    bool b10 = isPalindrome(to!string(n));
    
    if (!b10)
        return false;
    
    return isPalindrome(binary(n));        
}

void main(string[])
{
    assert(isPalindromicB10B2(585));
    int sum = 0;
    for (int i = 1; i < 1000000; ++i)
    {
        if (isPalindromicB10B2(i))
        {
            writeln(i);
            sum += i;
        }
    }
    writeln(sum);
}


