Const
    fi = '';
    fo = '';
Var f, g: TEXT;
    k, res: INT64;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, k);
    res:=Round(Sqrt(k))+k;
    If Trunc(Sqrt(res))-Sqrt(res)=0 Then res:=res+1;
    Writeln(g, res);
    Close(g);
END.
