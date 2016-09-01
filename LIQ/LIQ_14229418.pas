Const   fipro = '';
        fopro = '';
Var     fi, fo: TEXT;
        a, f: Array [1..1000] Of LONGINT;
        maxl, i, j, n: LONGINT;
BEGIN
        Assign(fi, fipro); Reset(fi);
        Assign(fo, fopro); Rewrite(fo);
        Readln(fi, n);
        For i:=1 To n Do Read(fi, a[i]);
        maxl:=0;
        For i:=1 To n Do
        Begin
                f[i]:=1;
                For j:=1 To i-1 Do
                        If (a[i]>a[j]) And (f[i]<f[j]+1) Then f[i]:=f[j]+1;
                If f[i]>maxl Then maxl:=f[i];
        End;
        Writeln(fo, maxl);
        Close(fo);
END.
