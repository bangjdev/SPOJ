Var     fi, fo: TEXT;
        f: Array [0..101, 0..101] Of Char;
        b: Array [0..101, 0..101] Of BOOLEAN;
        i, j, r, c: BYTE;
        d: INTEGER;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, r, c);
        For i:=1 To r Do
        Begin
                For j:=1 To c Do
                Read(fi, f[i][j]);
                Readln(fi);
        End;
        d:=0;
        fillChar(b, sizeOf(b), TRUE);
        For i:=1 To r Do
        For j:=1 To c Do
        Begin
                If (f[i][j]='#') And (b[i][j]) Then
                Begin
                        If (b[i][j+1]) And (f[i][j+1]='#') And (b[i][j]) Then
                        Begin Inc(d); b[i][j+1]:=FALSE; b[i][j]:=FALSE; End;
                        If (b[i+1][j]) And (f[i+1][j]='#') And (b[i][j]) Then
                        Begin Inc(d); b[i+1][j]:=FALSE; b[i][j]:=FALSE; End;
                End;
                If (f[i][j]='#') And (b[i][j]) Then
                Begin
                        Inc(d);
                        b[i][j]:=FALSE;
                End;
        End;
        Writeln(fo, d);
        Close(fo);
END.
