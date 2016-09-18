Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    a: Array[1..1000000] Of LONGINT;
    it: Array[0..10000000] Of LONGINT;
    temp, res, n: INT64;
    i, m:LONGINT;
Function Max(a, b: LONGINT):LONGINT;
Begin
    If a>b Then Exit(a) Else Exit(b);
End;
Function query(k, l, r, i, j: LONGINT):INT64;
Var t1, t2: INT64;
Begin
    If (i>r) Or (j<l) Then Exit(0);
    If (i<=l) And (j>=r) Then
        Exit(it[k]);
    t1:=0; t2:=0;
    t1:=query(k*2, l, (l+r) Div 2, i, j);
    t2:=query(k*2+1, (l+r) Div 2 + 1, r, i, j);
    Exit(t1+t2);
End;
Procedure update(k, l, r, i: LONGINT);
Begin
    If (i<l) Or (i>r) Then Exit;
//    writeln(l, ' ', r, ' ', k);
    If l=r Then
    Begin
        it[k]:=it[k]+1;
        exit();
    End;
    update(k*2, l, (l+r) DIv 2, i);
    update(k*2+1, (l+r) Div 2 + 1, r, i);
    it[k]:=it[k*2]+it[k*2+1];
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n);
    m:=0;
    For i:=1 To n Do
    Begin Readln(f, a[i]); m:=Max(m, a[i]); End;
    fillChar(it, sizeOf(it), 0);
    res:=0;
    FOr i:=n DownTo 1 Do
    Begin
        temp:=query(1, 1, m, 1, a[i]-1);
        res:=res+temp;
        update(1, 1, m, a[i]);
    End;
    Writeln(g, res);
    Close(g);
END.
