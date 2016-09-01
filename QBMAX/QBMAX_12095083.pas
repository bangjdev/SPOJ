Var     fi, fo: TEXT;
        n, m, i, j, max: INTEGER;
        a, f: Array [-1..101, -1..101] Of INTEGER;
Function maxCost(a, b, c: INTEGER):INTEGER;
Begin
        maxCost:=a;
        If b>maxCost Then maxCost:=b;
        If c>maxCost Then maxCost:=c;
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, m, n);
        For i:=1 To m Do
        Begin
                For j:=1 To n Do Read(fi, a[i][j]);
                Readln(fi);
        End;
        fillChar(f, sizeOf(f), 0);
        For i:=1 To m Do f[i][1]:=a[i][1];
        For i:=1 To n Do Begin f[0][i]:=-32768; f[m+1][i]:=-32768; End;
        For j:=2 To n Do
        For i:=1 To m Do
                f[i][j]:=f[i][j] + maxCost(f[i-1][j-1], f[i][j-1], f[i+1][j-1])+a[i][j];
        max:=f[1][n];
        For i:=2 To m Do If f[i][n]>max Then max:=f[i][n];
        Writeln(fo, max);
        Close(fo);
END.
