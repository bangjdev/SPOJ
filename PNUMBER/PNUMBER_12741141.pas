Var     a, b, i: LONGINT;
Function isPrime(x: LONGINT):BOOLEAN;
Var     i: LONGINT;
Begin
        If x<2 Then Exit(FALSE);
        For i:=2 To Trunc(Sqrt(x)) Do
        If x Mod i = 0 Then Exit(FALSE);
        Exit(TRUE);
End;
BEGIN
        Readln(a, b);
        For i:=a To b Do
        If isPrime(i) Then Writeln(i);
END.
