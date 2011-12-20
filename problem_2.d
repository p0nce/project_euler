import std.stdio;

// By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
void main(string[])
{
    ulong a = 1;
    ulong b = 1;
    ulong sum = 0;
    while (true)
    {
        if ((a & 1) == 0) // even
        {
            sum += a;
        }
        
        if (a > 4000000)
          break;
        
        ulong c = a + b;
        a = b;
        b = c;
        
        
    }
    
    writefln("%s", sum);

}


