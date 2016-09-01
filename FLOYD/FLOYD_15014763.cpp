#include <iostream>
#include <fstream>
#define NONE   100000000
using namespace std;
int f[500][500],p[500][500];
int way[500];
int n, m, k, pt;
ifstream fi("floyd.inp");
void truyvet(int u, int v) {
    int t = p[u][v];
    if (t==0) {
        pt++;
        way[pt] = v;
        return;
    }
    truyvet(u, t);
    truyvet(t, v);
}
void floyd() {
    for (int k = 1; k<=n; k++)
        for (int u = 1; u<=n; u++)
            for (int v = u+1; v<=n; v++) {
                if (f[u][v]>f[u][k]+f[k][v]) {
                    f[u][v] = f[u][k]+f[k][v];
                    f[v][u] = f[u][v];
                    p[u][v] = k;
                    p[v][u] = k;
                }
            }
    for (int i = 1; i<=n; i++)
    for (int j = 1; j<=n; j++)
        if (f[i][j] == NONE)
            f[i][j] = -1; // khong the di
}

void readData() {
    int u, v, c;
    cin>>n>>m>>k;
    for (int u = 1; u<=n; u++)
        for (int v = 1; v<=n; v++) {
            f[u][v] = NONE;
        }
    for (int i = 1; i<=n; i++) f[i][i] = 0;
    for (int i = 1; i<=n; i++)
    for (int j = 1; j<=n; j++)
        p[i][j] = 0;
    for (int i = 1; i<=m; i++) {
        cin>>u>>v>>c;
        f[u][v] = c;
        f[v][u] = c;
    }
}
void initData() {

}
int main() {
    initData();
    readData();
    floyd();
    int u, v, cauhoi;
    for (int i = 1; i<=k; i++) {
        cin>>cauhoi>>u>>v;
        if (cauhoi==1 && f[u][v]!=-1) {
            pt = 1;
            way[1] = u;
            truyvet(u, v);
            cout<<pt;
            for (int j = 1; j<=pt; j++) cout<<" "<<way[j];
            cout<<endl;
        } else
        if (f[u][v]!=-1){
            cout<<f[u][v]<<endl;
        } else
            cout<<-1<<endl;
    }
}
