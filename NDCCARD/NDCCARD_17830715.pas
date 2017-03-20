#include <bits/stdc++.h>

using namespace std;

long long n, m, a[100000], j, k, res = 0;

int main() {
    #ifndef ONLINE_JUDGE
    freopen("ndccard.inp", "r", stdin);
    freopen("ndccard.out", "w", stdout);
    #endif // ONLINE_JUDGE
    scanf("%lld%lld", &n, &m);
    for (int i = 1; i<=n; i++)
        scanf("%lld", &a[i]);

    sort(a+1, a+n+1);

    for (int i = 1; i<n-1; i++) {
        j = i+1;
        k = n;
        while (j<k) {
            if (a[i]+a[j]+a[k]<=m && a[i]+a[j]+a[k]>res) {
                res = a[i]+a[j]+a[k];
                j++;
            }
            else k--;
        }
    }
    printf("%lld", res);
    return 0;
}
