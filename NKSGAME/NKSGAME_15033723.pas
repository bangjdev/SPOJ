Type
    list = Array[1..100000] Of INT64;
Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    n, i, j: LONGINT;
    a, b: list;
    minn: INT64;
Procedure sort(Var a: list; l, r: LONGINT);
Var x, temp: INT64;
    i, j: LONGINT;
Begin
    x:=a[(l+r) Div 2];
    i:=l;
    j:=r;
    While i<=j Do
    Begin
        While a[i]<x Do Inc(i);
        While a[j]>x Do Dec(j);
        If i<=j Then
        Begin
            temp:=a[i];
            a[i]:=a[j];
            a[j]:=temp;
            Inc(i);
            Dec(j);
        End;
    End;
    If i<r Then Sort(a, i, r);
    If l<j Then Sort(a, l, j);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n);
    For i:=1 To n Do Read(f, a[i]);
    For i:=1 To n Do Read(f, b[i]);
    sort(a, 1, n);
    sort(b, 1, n);
    i:=1; j:=n; minn:=HIGH(LONGINT);
    Repeat
    Begin
        If Abs(a[i]+b[j])<minn Then minn:=Abs(a[i]+b[j]);

        If a[i]+b[j]>0 Then
        Dec(j) Else Inc(i);
    End;
    Until (i>n) Or (j<1);
    Writeln(g, minn);
    Close(g);
END.
