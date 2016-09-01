Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    i, j, k, s1, s2, s3, max: LONGINT;
    d: Array[0..10000] Of LONGINT;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, s1, s2, s3);
    fillChar(d, sizeOf(d), 0);
    max:=0;
    For i:=1 To s1 Do
    For j:=1 To s2 Do
    For k:=1 To s3 Do
    Begin
        Inc(d[i+j+k]);
        If d[i+j+k]>d[max] Then max:=i+j+k;
    End;
    Writeln(g, max);
    Close(g);
END.
