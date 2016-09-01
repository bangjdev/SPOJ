Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    a, n, m: Array[0..200000] Of INT64;
    i: LONGINT;
    maxx, t: INT64;
Function Max(a, b: INT64):INT64;
Begin
    If a>b Then Exit(a) Else Exit(b);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, t);
    maxx:=0;
    For i:=1 To t Do
    Begin
        Readln(f, n[i]);
        maxx:=Max(maxx, n[i]);
    End;
    a[0]:=0;
    a[1]:=1;
    For i:=1 To maxx Div 2 Do
    Begin
        a[2*i]:=a[i];
        a[2*i+1]:=a[i]+a[i+1];
    End;
    m[1]:=1;
    For i:=2 To maxx Do
    m[i]:=Max(a[i], m[i-1]);
    For i:=1 To t Do
    Writeln(g, m[n[i]]);
    Close(g);
END.
