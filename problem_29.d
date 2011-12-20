import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;

T[] bubbleSort(T)(in T[] input)
{
    T[] res = input.dup;
    
    for (int i = 0; i < res.length; ++i)
        for (int j = res.length - 1; j > i; --j)
        {
            if (res[j - 1] > res[j])
            {
                T tmp = res[j - 1];
                res[j - 1] = res[j];
                res[j] = tmp;
            }           
        }
    
    return res;
}

T[] removeDuplicates(T)(T[] input)
{
    T[] sorted = array(bubbleSort(input));
    T[] res;
    
    T last;
    for (int i = 0; i < sorted.length; ++i) 
    {
        bool isNew = (i == 0) || (last != sorted[i]);
        last = sorted[i];
        if (isNew)
            res ~= sorted[i];                    
    }
    return res;    
}

void main(string[])
{
    BigInt[] gen;
    for (BigInt a = 2 ; a <= 100; ++a)
        for (int b = 2 ; b <= 100; ++b)
        {
            gen ~= (a ^^ b);
        }
    BigInt[] diff = removeDuplicates(gen);
  //  int n = diff.length;
  //  writefln("%s", n);
    
}
