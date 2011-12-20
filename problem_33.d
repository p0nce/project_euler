import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;
import std.string;

bool isCuriousFraction(int num, int den)
{
    assert(den <= 99);
    assert(num < den);
    assert(num >= 0);
    assert(den >= 1);

    bool ok(int n, int d)
    {
        return n * den == d * num;
    }
    
    bool sok(string n, string d)
    {
        return ok(to!int(n), to!int(d));
    }
    
    string sden = to!string(den);
    string snum = to!string(num);
    assert(sden.length == 2);
    assert(snum.length == 2);
    
    string a = snum[0..1];
    string b = snum[1..2];
    string c = sden[0..1];
    string d = sden[1..2];
    
    if (a == d)
        return sok(b, c);
    if (b == c)
        return sok(a, d);
    return false;
}

void main(string[])
{
    for (int den = 10; den <= 99; ++den)
    {
        for (int num = 10; num < den; ++num)
        {
            if (isCuriousFraction(num, den))
                writefln("%s / %s is curious", num, den);
        }        
    }
}
