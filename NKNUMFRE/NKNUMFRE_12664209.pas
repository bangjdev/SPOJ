Var     fi, fo: TEXT;
        a, b, i, j, d: LONGINT;
Function GCD(x, y: LONGINT):LONGINT;
Begin
        If (x Mod y) = 0 Then Exit(y)
        Else If y Mod x = 0 Then Exit(x);
        Exit(GCD(y, x Mod y));
End;
Function dao(x: LONGINT):LONGINT;
Begin
        dao:=0;
        While x>0 Do
        Begin
                dao:=dao*10 + x Mod 10;
                x:=x Div 10;
        End;
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, a, b);
        d:=0;
        For i:=a To b Do
        Begin
                j:=dao(i);
                If GCD(i, j)=1 Then Inc(d);
        End;
        Writeln(fo, d);
        Close(fo);
END.
