Var     s: ANSISTRING;
        x, max: STRING;
        i, n: LONGINT;
BEGIN
        Readln(n);
        Str(n, max);
        s:='1234567891011121314151617181920212223242526272829';
        i:=30;
        For i:=30 To n Do
        Begin
                Str(i, x);
                s:=s+x;
        End;
        Writeln(pos(max, s));
END.
