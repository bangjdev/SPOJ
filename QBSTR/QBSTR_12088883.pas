Var     fi, fo: TEXT;
        s, s1, temp: STRING;
        f: Array [0..2000, 0..2000] Of INTEGER;
        i, j: INTEGER;
Function max(a, b: INTEGER):INTEGER;
Begin
        max:=a;
        If b>max Then max:=b;
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, s);
        Readln(fi, s1);
        temp:='';
        For i:=0 To Length(s) Do f[i][0]:=0;
        For j:=1 To Length(s1) Do f[0][j]:=0;
        For i:=1 To Length(s) Do
                For j:=1 To Length(s1) Do
                        If s[i]=s1[j] Then
                        Begin
                                f[i][j]:=f[i-1][j-1]+1;

                        End
                        Else
                        Begin
                                 f[i][j]:=max(f[i-1][j], f[i][j-1]);
                        End;
        Writeln(fo, f[Length(s), Length(s1)]);
        Close(fo);
END.
