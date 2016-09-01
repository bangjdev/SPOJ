#include <stdio.h>
int min(int a, int b) {
	if (a<b)
		return a;
	return b;
}
int main() {
	int n;
	scanf("%d", &n);
	int a[n+1], f[n+1];
	for (int i = 1; i<n; i++)
		scanf("%d", &a[i]);
	f[1] = 0;
	f[2] = a[1];
	f[3] = f[2] + a[2];
	for (int i = 4; i<=n; i++) {
		f[i] = min(f[i-1]+a[i-1], f[i-2] + a[i-1]);
	}
	printf("%d", f[n]);
	return 0;
}
