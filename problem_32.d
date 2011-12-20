import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;
import std.string;

bool sfind(string s, char c)
{
    for (int i = 0; i < s.length; ++i)
        if (s[i] == c)
            return true;
    return false;
}

bool isPandigitalProduct(int a, int b)
{
    int c = a * b;
    
    string s = to!string(a) ~ to!string(b) ~ to!string(c);
//    writefln("%s", s);
    if (s.length != 9)
        return false;
    
    for(int i = 0; i < 9; ++i)
        if (!sfind(s, cast(char)('1' + i)))
            return false;
        
    writefln("%s x %s = %s is pandigital", a, b, c);
    return true;
}

void main(string[])
{
    int N = 2000;
    assert(isPandigitalProduct(39, 186));  
    bool[] P;
    P.length = N*N;
    P[] = false;
    
    for (int a = 1; a < N; ++a)
        for (int b = a + 1; b < N; ++b)
        {
            if (isPandigitalProduct(a, b))
                P[a*b] = true;
        }
    
    int sum = 0;
    for(int i = 0; i < P.length; ++i)
        if(P[i])
            sum += i;
    writefln("%s", sum);
}
