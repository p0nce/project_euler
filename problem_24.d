import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;

T fact(T)(T n)
{
    assert(n >= 0);
    T res = 1;
    for (T i = 2; i <= n; ++i)
    {
        res *= i;        
    }
    return res;
}

T[] nthPermutation(T, U)(T[] input, U nth)
{
    writefln("%s %s", input, nth);
    if (input.length <= 1)
    {
        assert(nth == 0);
        return input;    
    }
    else
    {
        U totalPerm = fact(input.length);
        assert(nth < totalPerm);
        U firstIndex = nth / fact(input.length - 1);
        assert(firstIndex >= 0 && firstIndex < input.length);
        T first = input[firstIndex];
        writefln("taking first %s", first);
        T[] rest = input[0..firstIndex] ~ input[(firstIndex+1)..$];        
        T[] rest2 = nthPermutation(rest, nth % fact(input.length - 1));
        return [first] ~ rest2;
    }
}

void main(string[])
{
    auto symbols = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    
    writeln(join(nthPermutation(symbols, 1000000 - 1)));
}
