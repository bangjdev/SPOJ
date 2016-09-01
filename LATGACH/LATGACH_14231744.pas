Const   fipro = '';
        fopro = '';
Var fi, fo: TEXT;
    t, n, i, k: LONGINT;
    f: Array[1..100] Of STRING;
Function sum(a, b: STRING):STRING;
Var temp, mem: BYTE;

Begin
    sum:='';
    While Length(a)<Length(b) Do a:='0'+a;
    While Length(b)<Length(a) Do b:='0'+b;
    mem:=0;
    For i:=Length(a) DownTo 1 Do
    Begin
        temp:=Ord(a[i])+Ord(b[i])-48*2+mem;
        mem:=0;
        If temp>9 Then Begin mem:=1; temp:=temp Mod 10; End;
        sum:=Chr(temp+48)+sum;
    End;
    If mem<>0 Then sum:='1'+sum;
End;
BEGIN
    Assign(fi, fipro); Reset(fi);
    Assign(fo, fopro); Rewrite(fo);
    Readln(fi, t);
    f[1]:='1'; f[2]:='2'; k:=3;
    For i:=1 To t Do
    Begin
        Readln(fi, n);
        If n=0 Then Break;
        If f[n]<>'' Then Writeln(fo, f[n]) Else
        Begin
            For k:=k To n Do
            f[k]:=sum(f[k-1], f[k-2]);
            Writeln(fo, f[n]);
        End;
    End;
    Close(fo);
END.
