#include <iostream>
using namespace std;
int min(int a, int b) {
	if (a<b) return a;
		else return b;
}
int main() {
	int n;	
	cin>>n;
	int t[n+1], r[n+1];
	for (int i = 1; i<=n; i++)
		cin>>t[i];
	for (int i = 1; i<n; i++)
		cin>>r[i];
	int f[n+1];
	for (int i = 0; i<=n; i++) 
		f[i] = 0;
	f[1] = t[1];
	f[2] = min(f[1]+t[2], r[1]);
	for (int i = 3; i<=n; i++) {
		f[i] = min(f[i-2]+r[i-1], f[i-1]+t[i]);
	}
	cout<<f[n];
	return 0;
}
