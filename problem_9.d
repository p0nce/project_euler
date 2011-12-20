import std.stdio;
import std.math;
import std.algorithm;
import std.conv;


void main(string[])
{    
   for (long a = 0; a <= 1000; ++a)
   {
       for (long b = a + 1; b <= 1000; ++b)
       {
           long c = 1000 - a - b;
           
           if (c < 0)
            continue;
            
           if (c <= b)
            continue;
            
           if (a * a + b * b == c * c)
           writefln("a = %s  b = %s  c = %s", a, b, c);
           
           
       }
   }
}


