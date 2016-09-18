Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    r: Array[0..1000, 0..1000] Of LONGINT;
    a, b: Array[1..1000] Of LONGINT;
    i, j, m, n: LONGINT;
Function Max(a, b: LONGINT):LONGINT;
Begin
    If a>b Then Exit(a) Else Exit(b);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, m, n);
    For i:=1 To m Do Readln(f, a[i]);
    For i:=1 To n Do Readln(f, b[i]);
    For i:=0 To Max(m, n) Do
    Begin r[i][0]:=0; r[0][i]:=0; End;
    For i:=1 To m Do
    For j:=1 To n Do
    Begin
        If a[i]=b[j] Then // take
        Begin
            If (i>=3) And (j>=3) Then r[i][j]:=r[i-2][j-2]+1 Else
            Begin
                If i>=3 Then r[i][j]:=r[i-2][j]+1 Else
                If j>=3 Then r[i][j]:=r[i][j-2]+1 Else
                r[i][j]:=1;
            End;
        End Else
        // not take
        Begin
            r[i][j]:=Max(r[i-1][j], r[i][j-1]);
        End;

    End;
    Writeln(g, r[m][n]);
    Close(G);
END.
