Uses
    MATH;
Const
    fi = '';
    fo = '';
    c = 1000000007;
Var f, g: TEXT;
    res, mu: Array[0..1000000] Of INT64;
    key: Array['a'..'z'] Of LONGINT;
    hb1, k, d, l, somu: INT64;
    i: LONGINT;
    h, h2: Array[0..1000000] Of INT64;
    a, b: ANSISTRING;
    cc: CHAR;
{Function power(x, y, m: INT64):INT64;
Var i: LONGINT;
Begin
    power:=1;
    For i:=1 To y Do
    power:=(power*x) Mod m;
End;         }
Function getHash(a: ANSISTRING; m: INT64):INT64;
Var i: LONGINT;
    k: INT64;
Begin
    getHash:=0;
    For i:=1 To Length(a) Do
    Begin
        k:=mu[Length(a)-i];
        getHash:=(getHash + (k*key[a[i]] Mod m) Mod m) Mod m;
    End;
End;
Function getHash1(l, r, m: INT64):INT64;
Var k:INT64;
Begin
    k:=somu;
    Exit((h[r]-(h[l-1]*k) Mod m + m) Mod m);
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, a);
    Readln(f, b);
    mu[0]:=1;
    For i:=1 To Length(a) Do
    mu[i]:=(mu[i-1]*26) Mod c;
    somu:=mu[length(b)];
    For cc:='a' To 'z' Do
    key[cc]:=Ord(cc)-Ord('a')+1;
    hb1:=getHash(b, c);
    fillChar(h, sizeOf(h), 0);
    d:=0;
    h[0]:=0;
    For i:=1 To Length(a) Do
    Begin
        h[i]:=((h[i-1]*26) Mod c + key[a[i]] Mod c) Mod c;
    End;
    For i:=1 To Length(a)-(Length(b)-1) Do
    Begin
        k:=getHash1(i, i+Length(b)-1, c);
        If (k=hb1) Then Begin Inc(d); res[d]:=i; End;
    End;
    If d<>0 Then
        For i:=1 To d Do Write(g, res[i], ' ');
    Close(g);
END.
