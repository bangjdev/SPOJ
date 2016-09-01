Uses    MATH;
Var     fi, fo: TEXT;
        i, n, q, maxH, minH, a, b: LONGINT;
        h, fmin, fmax: Array [1..200000] Of LONGINT;
Procedure initMin(i, l, r: LONGINT);
Begin
        If (l=r) Then Begin fmin[i]:=h[l]; Exit; End;
        initMin(i*2, l, (l+r) Div 2);
        initMin(i*2+1, (l+r) Div 2 +1, r);
        fmin[i]:=Min(fmin[i*2], fmin[i*2+1]);
End;
Procedure initMax(i, l, r: LONGINT);
Begin
        If (l=r) Then Begin fmax[i]:=h[l]; Exit; End;
        initMax(i*2, l, (l+r) Div 2);
        initMax(i*2+1, (l+r) Div 2 +1, r);
        fmax[i]:=Max(fmax[i*2], fmax[i*2+1]);
End;
Procedure getMin(i, u, v, l, r: LONGINT);
Begin
        If (v<l) Or (u>r) Then Exit;
        If (l>=u) And (r<=v) Then
        Begin minH:=Min(minH, fmin[i]); Exit; End;
        getMin(2*i, u, v, l, (l+r) Div 2);
        getMin(i*2+1, u, v, (l+r) Div 2 + 1, r);
End;
Procedure getMax(i, u, v, l, r: LONGINT);
Begin
        If (v<l) Or (u>r) Then Exit;
        If (l>=u) And (r<=v) Then
        Begin maxH:=Max(maxH, fmax[i]); Exit; End;
        getMax(2*i, u, v, l, (l+r) Div 2);
        getMax(i*2+1, u, v, (l+r) Div 2 + 1, r);
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        Readln(fi, n, q);
        For i:=1 To n Do Readln(fi, h[i]);
        initMin(1, 1, n);
        initMax(1, 1, n);
        For i:=1 To q Do
        Begin
                Readln(fi, a, b);
                minH:=HIGH(LONGINT);
                getMin(1, a, b, 1, n);
                maxH:=0;
                getMax(1, a, b, 1, n);
                Writeln(fo, maxH-minH);
        End;
        Close(fo);
END.
