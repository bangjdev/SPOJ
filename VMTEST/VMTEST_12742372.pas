Var     fi, fo: TEXT;
        list: Array [1..10000] Of STRING;
        err, i, j, d, d1: INTEGER;
        so: REAL;
        s, temp, kq: STRING;
        kt: BYTE;
Function isNum(x: STRING):BOOLEAN;
Var     so: REAL;
Begin
        Val(x, so, err);
        if err=0 Then Exit(TRUE) Else Exit(FALSE);
End;
Function SumWord:STRING;
Begin
        SumWord:='';
        For j:=1 To d Do SumWord:=SumWord + list[j];
End;
Function SumNum:STRING;
Var     x, so: REAL;
Begin
        x:=0;
        For j:=1 To d Do
        Begin
                Val(list[j], so, err);
                x:=x+so;
        End;
        Str(x:0:6, SumNum);
End;
BEGIN
        Assign(fi, ''); Reset(fi);
        Assign(fo, ''); Rewrite(fo);
        While Not Eof(fi) Do
        Begin
                Readln(fi, s);
                If s = '?' Then Break;
                i:=1;
                kt:=1;
                While i<=Length(s) Do
                Begin
                        temp:='';
                        If s[i]<>' ' Then
                        While (i<=Length(s)) And (s[i]<>' ') Do
                        Begin
                                temp:=temp+s[i];
                                Inc(i);
                        End;
                        If temp<>'' Then
                        Begin
                        Inc(d);
                        list[d]:=temp;
                        End;
                        Inc(i);
                End;
                d1:=0;
                For i:=1 To d Do
                If isNum(list[i]) Then Inc(d1);
                If d=d1 Then kt:=1 Else
                If d1=0 Then kt:=2 Else
                kt:=0;
                Case kt Of
                1: kq:=SumNum;
                2: kq:=SumWord;
                0: kq:='Error!';
                End;
                Writeln(fo, kq);
                d:=0;
        End;
        Close(fo);
END.
