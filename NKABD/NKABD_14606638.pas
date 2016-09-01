Var     l, r, i, d: LONGINT;
        p: Array[0..100000] Of BOOLEAN;
Function sumDivisors(x: LONGINT):INT64;
Var     i: LONGINT;
        s: INT64;
Begin
        s:=1;
        For i:=2 To Trunc(Sqrt(x)) Do
        If x Mod i = 0 Then
                s:=s+i+x Div i;
        If Sqr(Trunc(Sqrt(x)))=x Then s:=s-Trunc(Sqrt(x));
        Exit(s);
End;
Procedure sieve(n:LONGINT);
Var     i, j: LONGINT;
Begin
        fillChar(p, sizeOf(p), TRUE);
        p[0]:=FALSE; p[1]:=FALSE;
        For i:=2 To n Do
        If p[i] Then
        Begin
                j:=i+i;
                While (j<=n) Do
                Begin
                        p[j]:=FALSE;
                        j:=j+i;
                End;
        End;
End;
BEGIN
        Read(l, r);
        d:=0;
        sieve(r);
        For i:=l To r Do
        If (Not p[i]) And (sumDivisors(i)>i) Then Inc(d);
        If d=0 Then Writeln(-1) Else Writeln(d);
END.

