import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.bigint;

string[20] digits = [ 
 "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
 "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
];

string english(int x)
{   
    if (x >= 0 && x <= 19) return digits[x];

    if (x >= 20 && x <= 29) return "twenty " ~ english(x - 20);
    if (x >= 30 && x <= 39) return "thirty " ~ english(x - 30);
    if (x >= 40 && x <= 49) return "forty " ~ english(x - 40);
    if (x >= 50 && x <= 59) return "fifty " ~ english(x - 50);
    if (x >= 60 && x <= 69) return "sixty " ~ english(x - 60);
    if (x >= 70 && x <= 79) return "seventy " ~ english(x - 70);
    if (x >= 80 && x <= 89) return "eighty " ~ english(x - 80);
    if (x >= 90 && x <= 99) return "ninety " ~ english(x - 90);
    if (x >= 100 && x <= 999) 
    {
        auto rest = x % 100;
        string s = digits[(x / 100)] ~ " hundred ";
        if (rest != 0)
            s ~= "and " ~ english(rest);
        return s;
    }
    if (x == 1000) return "one thousand";
    return "";
}

int letters(string s)
{
    int n;
    foreach(char c; s)
    {
        if (c >= 'a' && c <= 'z')        
            ++n;
    }
    return n;
}

void main(string[])
{
    int sum = 0;
    for(int i = 1; i <= 1000; ++i)
    {
        writefln("%s: %s, %s letters", i, english(i), letters(english(i)));
        if (i == 999)
        {
            i = i;
        }
        sum += letters(english(i));
    }
    writefln("sum of letters: %s", sum); // 21151
}
