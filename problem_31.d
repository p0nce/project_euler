import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;
import std.string;

int waysTodo(int n, int[] possibleValues)
{
    assert(n >= 0);
    
    if (n == 0)
        return 1;
    
    if (possibleValues.length == 0)
        return 0;
    
    int res = 0;
    
    int p1 = possibleValues[0];
    int max = n / p1;
    for (int i = 0; i <= max; ++i)
    {
        res += waysTodo(n - p1 * i, possibleValues[1..$]);
    }
    return res;
}

void main(string[])
{
    int[] values = [1, 2, 5, 10, 20, 50, 100, 200];
    writefln("%s", waysTodo(200, values));    
}
