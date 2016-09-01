Var	fi, fo: TEXT;
	n, k, i, c: LONGINT;
	f: Array[0..100000] Of LONGINT;
	broke: Array[1..100000] Of BOOLEAN;
BEGIN
	Assign(fi, ''); Reset(fi);
	Assign(fo, ''); Rewrite(fo);
	Read(fi, n, k);
	Readln(fi);
	For i:=1 To k Do Begin Read(fi, c); broke[c]:=TRUE; End;
	f[0]:=0; f[1]:=1;
	For i:=2 To n Do 
		If Not broke[i] Then f[i]:=(f[i-1]+f[i-2]) Mod 14062008
		Else f[i]:=0;
	writeln(fo, f[n]);
	close(fo);
END.
