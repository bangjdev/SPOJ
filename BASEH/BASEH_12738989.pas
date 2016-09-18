Var     k, q: LONGINT;
        x, x1: STRING;
BEGIN
        Readln(k);
        x:='';
        While k>0 Do
        Begin
                q:=k Mod 2;
                Str(q, x1);
                x:=x1+x;
                k:=k Div 2;
        End;
        Writeln(x);
END.
