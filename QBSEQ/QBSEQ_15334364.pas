Uses
    MATH;
Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    res: Array[0..1001, 0..50] Of INT64;
    k, n, i, j, s, t: LONGINT;
    r1, r2: INT64;
    a: Array[0..1001] Of LONGINT;
Function getMod(x, y: LONGINT):LONGINT;
Begin
    Exit(((x-y) mod k +k) mod k);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n, k);
    s:=0;
    For i:=1 To n Do
    Begin
        Read(f, a[i]);
        a[i]:=a[i] Mod k;
        s:=(s+a[i]) Mod k;
    End;
    For i:=0 TO k-1 Do
    res[0][i]:=HIGH(LONGINT);
    res[0][0]:=0;
    For i:=1 To n Do
    For j:=0 To k-1 Do
    Begin
        res[i][j]:=Min(res[i-1][j], 1+res[i-1][getMod(j, a[i])]);
    End;
    Writeln(g, n-res[n][s Mod k]);
    Close(g);
END.
