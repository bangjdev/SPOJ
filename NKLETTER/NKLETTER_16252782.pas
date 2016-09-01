Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    found: BOOLEAN;
    i: LONGINT;
    a, b, sb, se: STRING;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, sb);
    Readln(f, se);
    found:=FALSE;
    For i:=Length(se) DownTo 1 Do
    Begin
        a:=copy(se, 1, i);
        b:=copy(sb, Length(sb)-i+1, i);
        If a=b Then
        Begin
            found:=TRUE;
            Break;
        End;
    End;
    If Not found Then Writeln(g, Length(sb)+Length(se)) Else
    Begin
        Writeln(g, Length(sb)+Length(se)-i);
    End;
    Close(g);
END.
