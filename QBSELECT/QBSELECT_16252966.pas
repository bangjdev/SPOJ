Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    state: Array[1..8] Of LONGINT = (0, 1, 2, 4, 5, 8, 9, 10);
    a: Array[1..4, 1..100000] Of INT64;
    res: Array[1..100000, 0..100] Of INT64;
    n, i, j, k, d: LONGINT;
    r, m: INT64;
Function Max(a, b: INT64):INT64;
Begin
    If a>b Then Exit(a) Else Exit(b);
End;
Function sum(i, x: LONGINT):INT64;
Var j, k: LONGINT;
Begin
    sum:=0; k:=0;
    While x > 0 Do
    Begin
        Inc(k);
        If x Mod 2 = 1 Then sum:=sum+a[k][i];
        x:=x Div 2;
    End;
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n);
    d:=0;
    m:=LOW(INT64);
    For i:=1 To 4 Do
    Begin
        For j:=1 To n Do
        Begin
            Read(f, a[i][j]);
            If a[i][j]<0 Then Inc(d);
            m:=Max(a[i][j], m);
        End;
        Readln(f);
    End;
    If d=4*n Then
    Begin
        Writeln(g, m);
        Close(g);
        Exit;
    End;
    For i:=1 To n Do
    For j:=1 To 7 Do res[i][state[j]]:=LOW(INT64);
    For j:=1 To 8 Do
    res[1][state[j]]:=sum(1, state[j]);
    For i:=2 To n Do
    For j:=1 To 8 Do
    For k:=1 To 8 Do
    Begin
        If (state[j] And state[k] = 0) Then
        Begin
            res[i][state[j]]:=Max(res[i-1][state[k]]+sum(i, state[j]), res[i][state[j]]);
        End;
    End;
    r:=LOW(INT64);
    For i:=1 To 8 Do
    r:=Max(r, res[n][state[i]]);
    Writeln(g, r);
    Close(g);
END.
0 1 2 4 5 8 9 10
0001
0010
0100
0101
1000
1001
1010
