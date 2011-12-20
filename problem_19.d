import std.stdio;
import std.string;
import std.datetime;


void main(string[])
{
    int sum = 0;
    for(Date d = Date(1901, 1, 1); d <= Date(2000, 12, 31); d = d + dur!"days"(1))
    {        
        if (d.day == 1 && d.dayOfWeek() == DayOfWeek.sun)
            ++sum;
    }
    writefln("%s", sum); // 171
}



