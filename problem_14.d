import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;


void main(string[])
{
    bool even(BigInt x)
    {
        auto s = toDecimalString(x);
        auto c = s[s.length - 1];
        int value = c - '0';        
        return (value & 1) == 0;
    }
    
    BigInt next(BigInt x)
    {
        if (even(x))
            return x / BigInt(2);
        else return BigInt(3) * x + BigInt(1);
    }
    
    int N = 1000000;
    auto time = new int[N];
    
    time[] = -1;
    
    for (int i = 1; i < N; ++i)
    {
        BigInt c = i;
        int tries = 0;
      //  writefln("  c = %s", c);
        while (c != 1)
        {            
            uint cint = cast(uint)(c.toInt());
            if (c < BigInt(N) && time[cint] != -1)
            {
        //        writefln("  and %s goes to 1 in %s steps", cint, time[cint]);
                tries += time[cint];
                break;
            }
            
            c = next(c);
          //  writefln("  c = %s", c);
            tries++;
        }
        time[i] = tries;
        //writefln("%s => %s", i, tries);
    }
    
    int imax = -1, max = -1;
    for(int i = 1; i < N; ++i)
    {
        if (max < time[i])
        {
            max = time[i];
            imax = i;
        }        
    }
    
    writefln("%s", imax);
}