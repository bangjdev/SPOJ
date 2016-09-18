Var     fi, fo: TEXT;
        k, i, j, sl, d, n: LONGINT;
        ts: Array [1..10000] Of STRING;
        kt: BOOLEAN;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, k);
        i:=0;
        While Not(eof(fi)) Do
        Begin
                Readln(fi, n);
                For i:=i+1 To n+i Do
                Readln(fi, ts[i]);
                sl:=i;
        End;
        d:=0;
        For i:=1 To sl Do
        Begin
                kt:=TRUE;
                For j:=1 To i-1 Do
                If ts[j]=ts[i] Then Begin kt:=FALSE; Break; End;
                If kt Then Inc(d);
        End;
        Writeln(fo, d);
        Close(fo);
END.
