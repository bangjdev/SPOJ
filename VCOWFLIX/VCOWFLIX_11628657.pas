Type    tlist = Array [1..100] Of INTEGER;
Var     c, n, max: INTEGER;
        x, w: tlist;
        fo: TEXT;
Procedure readFile(fileName: STRING; Var  cnang, slbo: INTEGER; Var dsbo: tlist);
Var     fi: TEXT;
        i: INTEGER;
Begin
        Assign(fi, fileName);
        Reset(fi);
        Readln(fi, cnang, slbo);
        For i:=1 to slbo Do
        readln(fi, dsbo[i]);
        Close(fi);
End;
Procedure Process;
Var     k,sum:INTEGER;
Begin
        sum:=0;
        For k:=1 To n Do
        Begin
                If x[k]=1 Then sum:=sum+w[k];
                If sum=c Then
                Begin
                        max:=c;
                        Break;
                End;
        End;
        If (sum<c) And (sum>max) Then max:=sum;
End;
Procedure Attemp(i: INTEGER);
Var     j:INTEGER;
Begin
        If i>n Then Process Else
        For j:=0 To 1 Do
        Begin
                x[i]:=j;
                If i=n Then Process Else Attemp(i+1);
                x[i]:=0;
        End;
End;
BEGIN
        readFile('', c, n, w);
        max:=0;
        Attemp(1);
        Assign(fo, ''); Rewrite(fo);
        Write(fo, max);
        Close(fo);
END.
