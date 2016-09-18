#include <iostream>
using namespace std;
int main() {
	int n, k;
	cin>>n>>k;
	int a[n+1][n+1];
	int f[n+1][n+1];
	for (int i = 0; i<=n; i++) 
		for (int j = 0; j<=n; j++)
			f[i][j] = 0;
	for (int i = 1; i<=n; i++)
		for (int j = 1; j<=n; j++) {
			cin>>a[i][j];
			f[i][j] = f[i-1][j] + f[i][j-1] - f[i-1][j-1] + a[i][j];
		}
	int x, y;	
	int res = 0;
	for (int i = 1; i<=n-k+1; i++)
		for (int j = 1; j<=n-k+1; j++) {
			x = i + k - 1;
			y = j + k - 1;
			res = max(res, f[x][y]-f[x][j-1]-f[i-1][y]+f[i-1][j-1]);
		}
	cout<<res<<endl;
	return 0;
}
