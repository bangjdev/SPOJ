Var     fi, fo: TEXT;
        res, d: INT64;
        s: ANSISTRING;
        x, y: CHAR;
        i:LONGINT;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, s);
        Read(fi, x, y);
        res:=0; d:=0;
        For i:=Length(s) DownTo 1 Do
        Begin
                If s[i]=x Then Inc(res, d);
                If s[i]=y Then Inc(d);
        End;
        Writeln(fo, res);
        Close(fo);
END.
