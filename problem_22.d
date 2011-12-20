import std.stdio;
import std.stream;
import std.algorithm;
import std.stdio;
import std.array;


int score(string s)
{
    int score;
    for (int i = 0; i < s.length; ++i)
    {
        char c = s[i];
        assert(c >= 'A');
        assert(c <= 'Z');
        score += cast(int)(c - 'A' + 1);
    }
    return score;
}
    


void main(string[] args)
{
    assert (score("COLIN") == 53);
    auto file = new BufferedFile("problem_22_names.txt");
    char[] s = file.readLine();
    string[] s2 = split(cast(string)(s), ",");
    foreach(ref t;s2)
    {
        t = t[1..($-1)];              
    }
    
    s2 = array(sort(s2));
    int sum = 0;
    for (int i = 0; i < s2.length; ++i)
    {
        sum += score(s2[i]) * (i + 1);        
    }
    
    writeln(sum);
}