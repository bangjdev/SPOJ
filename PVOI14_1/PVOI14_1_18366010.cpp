#include <cstdio>
#include <iostream>

using namespace std;

struct paper {
    long long xa, ya, xb, yb, xc, yc, xd, yd;
};

int n;
paper a[100001];
long long xt, yt, x1 = -10000000000, y1 = -10000000000, x2 = 10000000000, y2 = 10000000000;

long long max(long long a, long long b) {
    return a>b?a:b;
}

long long min(long long a, long long b) {
    return a<b?a:b;
}

int odd(long long x) {
    return (x%2 != 0);
}

int main() {
    #ifndef ONLINE_JUDGE
    freopen("pinpos.inp", "r", stdin);
    freopen("pinpos.out", "w", stdout);
    #endif // ONLINE_JUDGE
    ios_base::sync_with_stdio(false);
    cin>>n;
    for (int i = 1; i<=n; i++)
        cin>>a[i].xa>>a[i].ya>>a[i].xb>>a[i].yb>>a[i].xc>>a[i].yc>>a[i].xd>>a[i].yd;
    for (int i = 1; i<=n; i++) {
        xt = min(min(a[i].xa - a[i].ya, a[i].xb - a[i].yb), min(a[i].xc - a[i].yc, a[i].xd - a[i].yd));
        yt = min(min(a[i].xa + a[i].ya, a[i].xb + a[i].yb), min(a[i].xc + a[i].yc, a[i].xd + a[i].yd));
        x1 = max(x1, xt);
        y1 = max(y1, yt);

        xt = max(max(a[i].xa - a[i].ya, a[i].xb - a[i].yb), max(a[i].xc - a[i].yc, a[i].xd - a[i].yd));
        yt = max(max(a[i].xa + a[i].ya, a[i].xb + a[i].yb), max(a[i].xc + a[i].yc, a[i].xd + a[i].yd));
        x2 = min(x2, xt);
        y2 = min(y2, yt);
    }
    long long q = (x2 - x1 - 1) * (y2 - y1 - 1), res;
    if (q <= 0)
        res = 0;
    else {
        if (odd(x1) == odd(y1))
            res = (q + 1) / 2;
        else res = q / 2;
    }
    cout<<res;
    return 0;
}
