Var     fi, fo: TEXT;
        n, k: LONGINT;
Function calc(m: LONGINT):LONGINT;
Var     t, a, b: LONGINT;
Begin
        t:=m+k;
        If m<k Then Exit(1);
        If t Mod 2 <> 0 Then Exit(1);
        a:=t Div 2;
        b:=a - k;
        If b<=0 Then Exit(1) Else
        Exit(calc(a)+calc(b));

End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, n, k);
        Writeln(fo, calc(n));
        Close(fo);
END.
