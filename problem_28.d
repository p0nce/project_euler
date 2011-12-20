import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;
import std.array;

void main(string[])
{
    int sum = 1;
    int n = 1;
    int increment = 2;
    for (int i = 0; i < 500; ++i)
    {
        n += increment;
        sum += n;
        n += increment;
        sum += n;
        n += increment;
        sum += n;
        n += increment;
        sum += n;
        increment += 2;
    }
  //  assert(n == 1001);
    writeln(sum);
}
