#include <bits/stdc++.h>
using namespace std;

int n, p, k, f[100000], res;

vector<pair<int, int> > ask[100000];

int max(int a, int b) {
    return a>b?a:b;
}

int main() {
    #ifndef ONLINE_JUDGE
    freopen("nkrez.inp", "r", stdin);
    freopen("nkrez.out", "w", stdout);
    #endif // ONLINE_JUDGE
    scanf("%d", &n);
    for (int i = 1; i<=n; i++) {
        scanf("%d%d", &p, &k);
        ask[k].push_back(make_pair(p, k));
    }
    for (int i = 0; i<=30000; i++) f[i] = 0;

    for (int i = 1; i<=30000; i++) {
        f[i] = f[i-1];
        for (int j = 0; j<ask[i].size(); j++) {
            if (ask[i][j].first == 0)
                f[i] = max(f[i], ask[i][j].second - ask[i][j].first);
            else
                f[i] = max(f[i], f[ask[i][j].first] + ask[i][j].second - ask[i][j].first);
        }
    }

    res = 0;
    for (int i = 1; i<=30000; i++)
        res = max(res, f[i]);

    printf("%d", res);
    return 0;
}
