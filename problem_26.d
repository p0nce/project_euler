import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;

BigInt one_over_n(int n)
{
    return (BigInt(10) ^^ 2000) / n;
}

int findCycleLength(string s)
{
    for (int i = 2; i < s.length / 2 - 1; ++i)
    {
        if (s[($ - i)..$] == s[($ - 2 * i)..($ - i)])
            return i;
    }
    assert(false); // no cycle found :(
}

void main(string[])
{
    int maxCycle = 0;
    int maxCycleIndex = 0;
    for(int i = 1; i < 1000; ++i)
    {        
        BigInt n = one_over_n(i);
        //writefln("%s => %s", i, n);
        int cycle = findCycleLength(toDecimalString(n));
        writefln("%s cycle %s", i, cycle);
        if (maxCycle < cycle)
        {
            maxCycleIndex = i;
            maxCycle = cycle;
        }
    }
    writefln("max cycle: 1/%s with %s digits", maxCycleIndex, maxCycle);
}
