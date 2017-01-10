
const   fi      ='';
        fo      ='';
        oo      =400;
 
var
        c       :Array[0..oo,0..oo] of char;
        l,h,dem:array[0..oo+1] of int64;
        m, n ,k   :longint;
        f       :array['A'..'E'] of int64;
        ans     :int64;
Function Calc(x,y,z:char):int64;
var     ans   :int64;
	i, j:longint;
begin
        fillchar(h, sizeof(h),0);
        fillchar(dem,sizeof(dem),0);
        fillchar(l,sizeof(l),0);
        ans:=0;
        for i:=1 to m do
                begin
                        for j:=1 to n do
                                begin
                                        if (c[i,j]=x) or (c[i,j]=y) or (c[i,j]=z) then begin
                                        l[j]:=j;
                                        h[j]:=h[j]+1;
                                        while h[l[j]-1]>h[j] do
                                                l[j]:=l[l[j]-1];
                                        dem[j]:=h[j]*(j-l[j]+1)+dem[l[j]-1];
                                        ans:=ans+dem[j];
                                        end
                                        else begin
                                                dem[j]:=0;
                                                l[j]:=0;
                                                h[j]:=0;
                                        end;
 
                                end;
 
                end;
        exit(ans);
end;
 
procedure run;
var     i, j, tg    :longint;
        s       :ansistring;
        x, y, z :char;
begin
        assign(input,fi);assign(output,fo);
        reset(input);rewrite(output);
        readln(m, n);
        ans:=0;
        for i:=1 to m do
                begin
                        readln(s);
                        for j:=1 to n do
                                c[i,j]:=s[j];
                end;
        for x:='A' to 'E' do
                f[x]:=Calc(x,x,x);
        for x:='A' to 'E' do
                for y:=succ(x) to 'E' do
                        for z:=succ(y) to 'E' do
                                ans:=ans+Calc(x,y,z)-Calc(x,x,y)-Calc(y,y,z)
                                        -Calc(z,z,x)
                                        +f[x]+f[y]+f[z];
        writeln(ans);
        close(input);close(output);
 
end;
 
begin
        run;
end.
