#include <bits/stdc++.h>
using namespace std;

int n, a[10000], f[10000];

int max(int a, int b, int c) {
    int r = a;
    if (b>r)
        r = b;
    if (c>r)
        r = c;
    return r;
}


int max(int a, int b) {
    return a>b?a:b;
}


int find(int value, int l, int r) {
    int k = -1;
    while (l<=r) {
        int x = (l+r) / 2;
        if (a[x] == value)
            return x;
        if (a[x]<value)
            l = x + 1;
        else
            r = x - 1;
    }
    return k;
}

int main() {
    #ifndef ONLINE_JUDGE
    freopen("nkjump.inp", "r", stdin);
    freopen("nkjump.out", "w", stdout);
    #endif // ONLINE_JUDGE
    scanf("%d", &n);
    for (int i = 1; i<=n; i++)
        scanf("%d", &a[i]);

    sort(a+1, a+n+1);

    for (int i = 1; i<=n; i++)
        f[i] = 1;

    for (int k = 3; k<=n; k++) {
        for (int j = 2; j<k; j++) {
            int i = find(a[k] - a[j], 1, j-1);
            if (i != -1)
                f[k] = max(f[k], f[i]+1, f[j]+1);
        }
    }
    for (int i = 1; i<=n; i++) {
//        printf("%d ", f[i]);
        f[n] = max(f[i], f[n]);
    }
    printf("%d", f[n]);
    return 0;
}
