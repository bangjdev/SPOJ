Uses    MATH;
Var     t, s: EXTENDED;
        i, n, d: LONGINT;
        res: Array [1..1000000] Of LONGINT;
Function numOfDigits(x: LONGINT):LONGINT;
Var     i: LONGINT;
        s: REAL;
Begin
        numOfDigits:=1;
        s:=1.0;
        For i:=1 To x Do
        Begin
                s:=s*i;
                If s>=10 Then
                While (s>=10) Do
                Begin
                        s:=s/10;
                        Inc(numOfDigits);
                End;
        End;

End;
BEGIN
        Readln(n);
        i:=1;
        t:=1;
        While Trunc(t)<=n Do
        Begin
                t:=t+log10(i);
                If Trunc(t)=n Then
                Begin
                        Inc(d);
                        res[d]:=i;
                End;
                Inc(i);
        End;
        If d<>0 Then
        Begin
                Writeln(d);
                For i:=1 To d Do Writeln(res[i]);
        End Else Writeln('NO');
END.
