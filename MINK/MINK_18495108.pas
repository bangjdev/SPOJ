#include <cstdio>

#define  oo  (long long) 2e9+1

using namespace std;

int T, n, k, a[100001], tree[400001];

int min(int a, int b) {
    return a<b?a:b;
}

void update(int node, int l, int r, int i, int val) {
    if (r < i || l > i)
        return;
    if (l == r) {
        tree[node] = val;
        return;
    }
    int mid = (l + r) / 2;
    update(node * 2, l, mid, i, val);
    update(node * 2 + 1, mid + 1, r, i, val);
    tree[node] = min(tree[node * 2], tree[node * 2 + 1]);
}

int query(int node, int l, int r, int u, int v) {
    if (r < u || l > v)
        return oo;
    if (u <= l && r <= v)
        return tree[node];
    int mid = (l + r) / 2;
    return min(query(node * 2, l, mid, u, v), query(node * 2 + 1, mid + 1, r, u, v));
}

int main() {
//    #ifndef ONLINE_JUDGE
//    freopen("mink.inp", "r", stdin);
//    freopen("mink.out", "w", stdout);
//    #endif // ONLINE_JUDGE
    scanf("%d", &T);
    for (int test = 1; test <= T; test++) {
        scanf("%d%d", &n, &k);
        for (int i = 1; i<=4*n; i++)
            tree[i] = 0;
        for (int i = 1; i<=n; i++) {
            scanf("%d", &a[i]);
            update(1, 1, n, i, a[i]);
        }
        for (int i = 1; i<=n-k+1; i++)
            printf("%d ", query(1, 1, n, i, i + k - 1));
        printf("\n");
    }
    return 0;
}
