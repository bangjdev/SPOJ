Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    cs: Array[1..50] Of INT64;
    k, t, n: INT64;
    i, res: LONGINT;
Function find(k: INT64):LONGINT;
Var i, j: LONGINT;
    t1, scs, dau, num, temp: INT64;
Begin
    For i:=1 To 19 Do
    If k>cs[i]*INT64(i) Then k:=k-cs[i]*INT64(i) Else Break;
    scs:=i;
    dau:=1;
    For j:=1 To scs-1 Do dau:=dau*10;
    num:=dau+k Div scs;
    If k Mod scs=0 Then dec(num);
    temp:=k Mod scs;
    If temp=0 Then temp:=scs;
    t1:=1;
    For i:=1 To temp-1 Do t1:=t1*10;
    t1:=dau Div t1;
    Exit((num Div t1) Mod 10);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n, t);
    cs[1]:=9;
    For i:=2 To 19 Do cs[i]:=cs[i-1]*10;

    k:=t-n;
    While k<t Do
    Begin
        Inc(k);
        res:=find(k);
        If k<=0 Then Write(g, ' ') Else Write(g, res);
    End;
    close(g);
END.
