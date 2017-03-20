#include <stdio.h>

#define     oo      10000000

int n, m, it[400001], inc[400001], res = -oo;

int max(int a, int b) {
    return a>b?a:b;
}

void init() {
	for (int i = 1; i <= 4 * n; i++) {
		it[i] = 0;
		inc[i] = 0;
	}
}

void update(int k, int l, int r, int x, int y, int v) {
    it[k] += inc[k];
    inc[k*2] += inc[k];
    inc[k*2+1] += inc[k];
    inc[k] = 0;
    if (r<x || l>y)
        return;
    if (x<=l && r<=y) {
        it[k] += v;
        inc[k*2] += v;
        inc[k*2+1] += v;
//        inc[k] = 0;
    } else {
        int m = (l + r) / 2;
        update(k*2, l, m, x, y, v);
        update(k*2+1, m+1, r, x, y, v);
        it[k] = max(it[k*2], it[k*2+1]);
    }
}

void getMax(int k, int l, int r, int x, int y) {
    it[k] += inc[k];
    inc[k*2] += inc[k];
    inc[k*2+1] += inc[k];
    inc[k] = 0;
    if (r<x || l>y)
        return;
    if (x<=l && r<=y)
        res = max(res, it[k]);
    else {
        int m = (l+r) / 2;
        getMax(k*2, l, m, x, y);
        getMax(k*2+1, m+1, r, x, y);
    }
}

void solve0() {
    int x, y, val;
    scanf("%d%d%d", &x, &y, &val);
    update(1, 1, n, x, y, val);
}

void solve1() {
    int x, y;
    scanf("%d%d", &x, &y);
    res = 0;
    getMax(1, 1, n, x, y);
    printf("%d\n", res);
}

int main() {
//    freopen("input.txt", "r", stdin);
	scanf("%d%d", &n, &m);
	init();
	int qt;
	for (int i = 1; i <= m; i++) {
		scanf("%d", &qt);
        if (qt == 0)
            solve0();
        else
            solve1();
	}
	return 0;
}
