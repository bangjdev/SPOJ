Var     fi, fo: TEXT;
        c, n, max, i: LONGINT;
        w,x: Array [1..100] Of INTEGER;
Procedure Process;
Var     s,i: LONGINT;
Begin
        s:=0;
        For i:=1 To n Do
        If x[i]=1 Then s:=s+w[i];
        If (s<=c) And (s>max) Then max:=s;
End;
Procedure Attemp(i: INTEGER);
Var     j: INTEGER;
Begin
        If i>n Then Process Else
        For j:=0 To 1 Do
        Begin
                x[i]:=j;
                Attemp(i+1);
                x[i]:=0;
        End;
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, c, n);
        For i:=1 To n Do Readln(fi, w[i]);
        max:=0;
        Attemp(1);
        Writeln(fo, max);
        Close(fo);
END.
