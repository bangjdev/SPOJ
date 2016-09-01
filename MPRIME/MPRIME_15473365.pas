Uses
    MATH;
Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    ip: Array[0..1000000] Of BOOLEAN;
    p: Array[1..1000000] Of LONGINT;
    c, n, d, i, j, timer: LONGINT;
    temp: INT64;
Function isPrime(x: INT64):BOOLEAN;
Var i, m: LONGINT;
Begin
    If (x=2) Or (x=3) Then Exit(TRUE);
    If (x<2) Or (x Mod 2 = 0) Or (x Mod 3 = 0) Then Exit(FALSE);
    m:=Trunc(Sqrt(x));
    i:=5;
    While i<=m Do
    Begin
        If (x Mod i = 0) Or (x Mod (i+2) = 0) Then Exit(FALSE);
        Inc(i, 6);
    End;
    Exit(TRUE);
End;

Function numberOfDigits(x: INT64):LONGINT;
Begin
    numberOfDigits:=0;
    If x=0 Then Exit(1);
    While x>0 Do
    Begin
        x:=x Div 10;
        Inc(numberOfDigits);
    End;
End;
Procedure sieve(x: INT64);
Var i: LONGINT;
    j: INT64;
Begin
    c:=0;
    fillChar(ip, sizeOf(ip), TRUE);
    ip[0]:=FALSE; ip[1]:=FALSE;
    For i:=2 To Trunc(Sqrt(x)) Do
    If ip[i] Then
    Begin
        j:=i*i;
        While j<=x Do
        Begin
            ip[j]:=FALSE;
            j:=j+i;
        End;
    End;
    For i:=2 To x Do
    If ip[i] THen Begin Inc(c); p[c]:=i; End;
End;
BEGIN

    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n);
    sieve(1000000);
    i:=1;
    d:=0;
    While d<n Do
    Begin
        temp:=p[i]*(10**numberOfDigits(p[i+1]))+p[i+1];
        If ((temp Mod 6 = 1) Or (temp Mod 6 = 5)) And isPrime(temp) Then
        Begin Inc(d); {Writeln(g, temp);} End;
        Inc(i, 2);
    End;
    Writeln(g, temp);
    Close(g);
END.




      {

function modb(x,y:extended):extended;
   begin
   modb:=y*frac(x/y);
   end;

   function snt(x:extended):boolean;
   var j,k:longint;
   begin

     if (x<=3) or (x=5) then
      begin
       snt:=true;exit;
       end;

       if (modb(x,2)=0) or (modb(x,3)=0) or (modb(x,5)=0) then
        begin
        snt:=false;exit;
        end;

       if x>3 then
       begin
       snt:=true;
       j:=5;
       k:=2;
       while j+k<=sqrt(x) do
       begin
        j:=j+k;
        if modb(x,j)=0 then
          begin
           snt:=false;
           exit;
          end;
          k:=k+6;
        end;
        end;
      end;
}
