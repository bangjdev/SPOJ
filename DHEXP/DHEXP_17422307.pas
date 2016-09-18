Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    a: Array[1..100000] Of INT64;
    n, k, i: LONGINT;
    res: INT64;
Procedure sort(l, r: INT64);
Var i, j, temp, x: INT64;
Begin
    i:=l;
    j:=r;
    x:=a[(l+r) Div 2];
    While i<=j Do
    Begin
        While a[i]>x Do Inc(i);
        While a[j]<x Do Dec(j);
        If i<=j Then
        Begin
            temp:=a[i];
            a[i]:=a[j];
            a[j]:=temp;
            Inc(i);
            Dec(j);
        End;
    End;
    If i<r Then Sort(i, r);
    If l<j Then Sort(l, j);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n, k);
    For i:=1 To n Do Read(f, a[i]);
    sort(2, n);
    res:=a[1];
    For i:=2 To n Do
    Begin
        If k>0 Then res:=res+a[i] Else res:=res-a[i];
        Dec(k);
    End;
    writeln(g, res);
    Close(g);
END.
