Var     fi, fo: TEXT;
        i, a, t, d, n: LONGINT;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, n);
        d:=0;
        For i:=1 To n Do
        Begin
                Readln(fi, a, a, t);
                If t = 1 Then Inc(d);
        End;
        Writeln(fo, d Mod 2);
        Close(fo);
END.
