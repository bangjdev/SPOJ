#include <cstdio>

#define  oo	1000000000000000LL

using namespace std;

int n, a[100001], res;
long long f[100003], temp;

long long min(long long a, long long b) {
    return a<b?a:b;
}

int main() {
//    freopen("nkseq.inp", "r", stdin);
//    freopen("nkseq.out", "w", stdout);
    scanf("%d", &n);
    for (int i = 1; i<=n; i++) {
	scanf("%d", &a[i]);
    }
    f[n + 1] = oo;
    temp = 0;
    for (int i = 1; i<=n; i++) {
        f[n+1] = min(f[n+1], temp + a[i]);
        temp += a[i];
    }
    for (int i = n; i>1; i--) {
	f[i] = min(a[i], f[i+1] + a[i]);
    }
    for (int i = 2; i <= n + 1; i++)
	if (f[i] > 0)
	    res ++;
    printf("%d", res);    
    return 0;
}
