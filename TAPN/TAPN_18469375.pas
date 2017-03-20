#include <cstdio>
#include <cmath>

using namespace std;

int n, m, p[1000], base[1000], x[100], sl1;
long long c[100], f[100][100];

void sieve(int x) {
    for (int i = 2; i<=x; i++)
        p[i] = i;
    p[0] = 1;
    p[1] = 1;
    int j;
    for (int i = 2; i<=trunc(sqrt(x)); i++)
    if (p[i] == i) {
        j = i * i;
        while (j <= x) {
            p[j] = i;
            j += i;
        }
    }
}

void fact_add(int x) {
    while (x > 1) {
        base[p[x]] ++;
        x /= p[x];
    }
}

void fact_sub(int x) {
    while (x > 1) {
        base[p[x]] --;
        x /= p[x];
    }
}

long long calc(int i, int j) {
    if (f[i][j] != -1)
        return f[i][j];
    if (i > n) {
        f[i][j] = (j == sl1)?1:0;
//        printf("%d %d %lld\n", i, j, f[i][j]);
        return (j == sl1)?1:0;
    }
    long long temp = 0;
    temp = calc(i + 1, j + 1) + calc(i + 1, j);
//    printf("%d %d %lld\n", i, j, temp);
    f[i][j] = temp;
    return f[i][j];
}

void retrieve(int i, int j) {
    if (i > n)
        return;
//    printf("%d %d and %d %d => ", i + 1, j, i+1, j+1);
    if (calc(i + 1, j + 1) < m) {
//        printf("%d\n", 1);
        x[i] = 0;
        m -= calc(i + 1, j + 1);
        retrieve(i + 1, j);
    } else {
//        printf("%d\n", 0);
        x[i] = 1;
        retrieve(i + 1, j + 1);
    }
}

void process() {
    for (int k = 1; k<=n; k++) {
        for (int j = 1; j<=100; j++)
            base[j] = 0;
        for (int j = 1; j<=n; j++)
            fact_add(j);
        for (int j = 1; j<=k; j++)
            fact_sub(j);
        for (int j = 1; j<=n-k; j++)
            fact_sub(j);
        c[k] = 1;
        for (int j = 1; j<=n; j++)
            c[k] = c[k] * pow(j, base[j]);
    }
    c[0] = 1;
    sl1 = -1;
//    for (int i = 0; i<=n; i++)
//        printf("tohop %d = %lld \n",i,  c[i]);
//    printf("\n");
    for (int k = 0; k<=n; k++)
    if (m > c[k]) {
        sl1 = k;
        m -= c[k];
    } else break;
    for (int i = 0; i<=n + 1; i++)
        for (int j = 0; j<=n+1; j++)
            f[i][j] = -1;
    sl1++;
//    printf("sl1: %d m: %d\n", sl1, m);
    f[1][0] = calc(1, 0);
//    printf("%lld\n", f[2][0]);
    retrieve(1, 0);
    long long res = 1;
    for (int i = 1; i <= n; i++) {
        res = (x[i] + 2) * res + 1;
    }
    printf("%lld\n", res);
}

int main() {
    #ifndef ONLINE_JUDGE
    freopen("set_n.inp", "r", stdin);
    freopen("set_n.out", "w", stdout);
    #endif // ONLINE_JUDGE
    sieve(1000);
    while (scanf("%d%d", &n, &m) != -1) {
        process();
    }
    return 0;
}
