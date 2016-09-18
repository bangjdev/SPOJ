Const
    fi = '';
    fo = '';
Var link, len: Array[0..1001, 0..1001] Of LONGINT;
    visit: Array[1..10000] Of BOOLEAN;
    a, b, l, cost, n, q, i, u, v: LONGINT;
    f, g: TEXT;
    hf: BOOLEAN;
Procedure DFS(cha, i, j: LONGINT);
Var k: LONGINT;
Begin
    If hf Then Exit;
    visit[i]:=TRUE;
    cost:=cost+len[cha][i];
    If i=j Then Begin hf:=TRUE; Exit; End;
    For k:=1 To link[i][0] Do
    If hf Then Exit Else
    If Not visit[link[i][k]] Then DFS(i, link[i][k], j);
    If hf Then Exit;
    cost:=cost-len[cha][i];
End;
BEGIN
    Assign(f, fi); Reset(f);
    Assign(g, fo); Rewrite(g);
    Readln(f, n, q);
    fillChar(len, sizeOf(len), 0);
    For i:=1 To n-1 Do
    Begin
        Readln(f, a, b, l);
        Inc(link[a][0]);
        link[a][link[a][0]]:=b;
        Inc(link[b][0]);
        link[b][link[b][0]]:=a;
        len[a][b]:=l; len[b][a]:=l;
    End;
    For i:=1 To q Do
    Begin
        Readln(f, u, v);
        cost:=0; hf:=FALSE;
        fillChar(visit, sizeOf(visit), FALSE);
        DFS(u, u, v);
        Writeln(g, cost);
    End;
    Close(g);
END.
