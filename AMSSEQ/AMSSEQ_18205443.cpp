#include <cstdio>
#include <algorithm>
using namespace std;

int n, k, a[10001], res, f[10001];

int main() {
	scanf("%d%d", &n, &k);
	for (int i = 1; i<=n; i++)
		scanf("%d", &a[i]);
	f[0] = 0;
	for (int i = 1; i<=n; i++) {
		f[i] = f[i-1] + a[i];
		for (int j = max(i - k, 0); j<i; j++) {
			f[i] = max(f[j] + a[i], f[i]);
		}
	}
	res = 0;
	for (int i = 0; i<=n; i++)
		res = max(res, f[i]);
	printf("%d", res);
	return 0;
}
