Var     fi, fo: TEXT;
        n: LONGINT;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        While TRUE Do
        Begin
                Readln(fi, n);
                If n=42 Then Break;
                Writeln(fo, n);
        End;
        Close(fo);
END.
