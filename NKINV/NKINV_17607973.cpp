#include <stdio.h>

int n, a[60001], res = 0, m = -2000000, it[1000000];

int max(int a, int b) {
	return a > b ? a : b;
}

void updateSum(int k, int l, int r, int i, int v) {
	if (l > i || r < i)
		return;
	if (l == r) {
		it[k] += v;
		return;
	}
	int m = (l + r) / 2;
	updateSum(k * 2, l, m, i, v);
	updateSum(k * 2 + 1, m + 1, r, i, v);
	it[k] = it[k * 2] + it[k * 2 + 1];
}

long getSum(int k, int l, int r, int u, int v) {
	if (l > v || r < u)
		return 0;
	if (u <= l && r <= v) {
		return it[k];
	}
	int m = (l + r) / 2;
	return getSum(k * 2, l, m, u, v) + getSum(k * 2 + 1, m + 1, r, u, v);
}

int main() {
	scanf("%d", &n);
	long tong;
	for (int i = 1; i <= n; i++) {
		scanf("%d", &a[i]);
		m = max(m, a[i]);
	}

	for (int i = 1; i<=n; i++) {
		tong = getSum(1, 1, m, a[i]+1, m);
		res += tong;
		updateSum(1, 1, m, a[i], 1);
	}

	printf("%d", res);

	return 0;
}
