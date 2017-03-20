#include <stdio.h>

int n, m, q, u, v, k, a[50001], sum[500001];
long maxx;

int max(int a, int b) {
	return (a > b) ? a : b;
}

void updateNodeMax(int k, int l, int r, int i, int v) {
	if (l > i || r < i)
		return;

	if (l == r) {
		sum[k] = v;
		return;
	}

	int m = (l + r) / 2;
	updateNodeMax(k * 2, l, m, i, v);
	updateNodeMax(k * 2 + 1, m + 1, r, i, v);
	sum[k] = max(sum[2 * k], sum[2 * k + 1]);
}

void queryMax(int k, int l, int r, int u, int v) {
	if (r < u || l > v)
		return;
	if (u <= l && r <= v) {
		maxx = max(maxx, sum[k]);
		return;
	}
	queryMax(k * 2, l, (l + r) / 2, u, v);
	queryMax(k * 2 + 1, (l + r) / 2 + 1, r, u, v);
}

int main() {

	scanf("%d%d", &n, &m);

	for (int i = 1; i <= n; i++)
		a[i] = 0;
	for (int i = 0; i < m; i++) {
		scanf("%d%d%d", &u, &v, &k);
		a[u] += k;
		a[v + 1] -= k;
	}
	for (int i = 2; i <= n; i++)
		a[i] = a[i] + a[i - 1];

	for (int i = 1; i <= n; i++)
		updateNodeMax(1, 1, n, i, a[i]);

	scanf("%d", &q);
	for (int i = 0; i < q; i++) {
		scanf("%d %d", &u, &v);
		maxx = -2000000000;
		queryMax(1, 1, n, u, v);
		printf("%ld\n", maxx);
	}

	return 0;
}
