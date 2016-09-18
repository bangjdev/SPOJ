Uses    MATH;
Var fi, fo: TEXT;
    x, s: ANSISTRING;
    i, j: LONGINT;
    f: Array[0..2000, 0..2000] Of LONGINT;
Function backTrack(i, j: LONGINT):ANSISTRING;
Begin
    If (i=0) Or (j=0) Then Exit('') Else
    If s[i]=x[j] Then Exit(backTrack(i-1, j-1)+s[i]) Else
    If f[i][j-1]>f[i-1][j] Then Exit(backTrack(i, j-1))
    Else Exit(backTrack(i-1, j));
End;
BEGIN
    Assign(fi, ''); Reset(fi);
    Assign(fo, ''); Rewrite(fo);
    Readln(fi, s);
    x:='';
    For i:=Length(s) DownTo 1 Do x:=x+s[i];
    For i:=1 To Length(s) Do
    Begin
        f[0][i]:=0;
        f[i][0]:=0;
    End;
    For i:=1 To Length(s) Do
    Begin
        For j:=1 To Length(x) Do
        If s[i]=x[j] Then f[i][j]:=f[i-1][j-1]+1
        Else f[i][j]:=Max(f[i][j-1], f[i-1][j]);
    End;
    {Write('   ', s[1]);
    For i:=2 To Length(s) Do Write(s[i]:3);
    Writeln;
    For i:=1 To Length(s) Do
    Begin
        Write(x[i]);
        For j:=1 To Length(s) Do
        Write(f[i][j]:3);
        Writeln;
    End;}
    {k:=0;}
    Writeln(fo, backTrack(Length(s), Length(s)));
    Close(fo);
END.
