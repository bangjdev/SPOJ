#include <cstdio>
#include <algorithm>

using namespace std;

struct strworker {
    long long l, p, s;
};

int n, k;
long long res, f[16001], c[101][16001];
strworker a[16001];
bool b[16001];

bool comp(strworker a, strworker b) {
    return a.s < b.s;
}

int main() {
//    freopen("gard.inp", "r", stdin);
//    freopen("gard.out", "w", stdout);
    scanf("%d %d", &n, &k);
    for (int i = 1; i<=n; i++)
        b[i] = false;
    for (int i = 1; i <= k; i++) {
        scanf("%lld%lld%lld", &a[i].l, &a[i].p, &a[i].s);
        b[a[i].s] = true;
    }

    sort(a+1, a+k+1, comp);

    for (int i = 1; i <= k; i++) {
        for (int len = 1; len <= a[i].l; len ++)
            if (a[i].s - len >= 0)
                c[i][len] = max(c[i][len - 1], f[a[i].s - len] + len * a[i].p);
            else c[i][len] = c[i][len - 1];
        for (int len = 0; len < a[i].l; len ++)
            if (a[i].s + len <= n)
                f[a[i].s + len] = max(f[a[i].s + len], c[i][a[i].l - len] + len * a[i].p);
    }


    for (int i = 1; i<=n; i++)
        res = max(res, f[i]);
    printf("%lld", res);

    return 0;
}
