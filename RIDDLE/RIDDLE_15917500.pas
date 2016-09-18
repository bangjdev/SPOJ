Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    n, k, i, res, t, test: LONGINT;
    a, aa: Array[1..100000] Of LONGINT;
    b: Array[1..100000] Of BOOLEAN;
{Function factable(x, n: LONGINT):BOOLEAN;
Var j: LONGINT;
Begin
    If x=0 Then Exit(TRUE);
    For j:=n DownTo 1 Do
    If b[j] And (a[j]<=x) Then
    Begin
        b[j]:=FALSE;
        If factable(x-a[j], n) Then
        Begin
            b[j]:=TRUE;
            Exit(TRUE);
        End;
        b[j]:=TRUE;
    End;
    Exit(FALSE);
End;}
Procedure Sort(l, r: LONGINT);
Var i, j, x, temp: LONGINT;
Begin
    x:=aa[(l+r) Div 2];
    i:=l;
    j:=r;
    While i<=j Do
    Begin
        While aa[i]<x Do Inc(i);
        While aa[j]>x Do Dec(j);
        If i<=j Then
        Begin
            temp:=aa[i];
            aa[i]:=aa[j];
            aa[j]:=temp;
            Inc(i);
            Dec(j);
        End;
    End;
    If i<r Then Sort(i, r);
    If l<j Then Sort(l, j);
End;
Function check(n: LONGINT):BOOLEAN;
Var i: LONGINT;
    sum: INT64;
Begin
    For i:=1 To n Do aa[i]:=a[i];
    Sort(1, n);
    sum:=0;
    For i:=1 To n Do
    Begin
        If aa[i]>sum+1 Then Exit(FALSE);
        sum:=sum+aa[i];
        If sum>=k Then Exit(TRUE);
    End;
    Exit(sum>=k);
End;
Function find(l, r: LONGINT):LONGINT;
Var k, x: LONGINT;
Begin
    k:=-1;
    While l<=r Do
    Begin
        x:=(l+r) Div 2;
        If check(x) Then
        Begin k:=x; r:=x-1; End Else
        l:=x+1;
    End;
    Exit(k);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, t);
    For test:=1 To t Do
    Begin
    	Readln(f, n, k);
    	For i:=1 To n Do Read(f, a[i]);
    	res:=find(1, n);
    	Writeln(g, res);
    End;
    Close(g);
END.
