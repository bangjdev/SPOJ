#include <cstdio>
#include <algorithm>

using namespace std;

struct tree {
    int x, y, z, id;
};

int n, k, pos[300001], maxx[100001], maxy[100001], f[300001];
tree a[300001];

bool compare(tree a, tree b) {
    if (a.x < b.x)
        return true;
    if (a.x > b.x)
        return false;
    return a.y<=b.y;
}

void update(int i) {
    maxx[a[i].x] = max(f[i], maxx[a[i].x]);
    maxy[a[i].y] = max(f[i], maxy[a[i].y]);
}

int main() {
    #ifndef ONLINE_JUDGE
    freopen("toad.inp", "r", stdin);
    freopen("toad.out", "w", stdout);
    #endif

    scanf("%d%d", &n, &k);
    for (int i = 1; i<=n; i++) {
        scanf("%d%d%d", &a[i].x, &a[i].y, &a[i].z);
        a[i].id = i;
    }
    sort(a + 1, a + n + 1, compare);
    for (int i = 1; i<=n; i++)
        pos[a[i].id] = i;
    f[pos[1]] = a[pos[1]].z;
    update(pos[1]);
    for (int i = pos[1] + 1; i<=pos[n]; i++) {
        if (maxx[a[i].x] >= k)
            f[i] = max(f[i], maxx[a[i].x] + a[i].z - k);
        if (maxy[a[i].y] >= k)
            f[i] = max(f[i], maxy[a[i].y] + a[i].z - k);
        update(i);
    }
    printf("%d", f[pos[n]]);
    return 0;
}
