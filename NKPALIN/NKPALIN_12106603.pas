Var     fi, fo: TEXT;
        s1, s2: ANSISTRING;
        i, j: INTEGER;
        f: Array[0..2000, 0..2000] Of INTEGER;
Function palin(xau: ANSISTRING):ANSISTRING;
Var     k: INTEGER;
Begin
        palin:='';
        For k:=Length(xau) DownTo 1 Do palin:=palin+xau[k];
End;
Function backTrack(i, j: INTEGER):ANSISTRING;
Begin
        If (i=0) Or (j=0) Then Exit('') Else
        If s1[i] = s2[j] Then Exit(backTrack(i-1, j-1)+s1[i])
        Else
                If f[i][j-1]>f[i-1][j] Then Exit(backTrack(i, j-1))
                Else Exit(backTrack(i-1, j));
End;
Function max(i, j: INTEGER):INTEGER;
Begin
        If i>j Then Exit(i) Else Exit(j);
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, s1);
        s2:=palin(s1);
        For i:=1 To Length(s1) Do f[i][0]:=0;
        For i:=1 To Length(s1) Do f[0][i]:=0;
        For i:=1 To Length(s1) Do
                For j:=1 to Length(s2) Do
                If s1[i]=s2[j] Then f[i][j]:=f[i-1][j-1]+1 else
                f[i][j]:=max(f[i][j-1], f[i-1][j]);
        Writeln(fo, backTrack(Length(s1), Length(s1)));
        CLose(fo);
END.
