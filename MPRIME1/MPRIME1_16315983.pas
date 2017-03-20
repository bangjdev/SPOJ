#include <iostream>
#include <cmath>
using namespace std;
int p[1000001], ip[1000001];
int num;
void sieve(int n) {
	ip[0] = 0;
	ip[1] = 0;
	ip[2] = 0;
	num = 0;
	int j;
	for (int i = 2; i<=(int)sqrt(n); i++) 
		if (ip[i] == 0) {
			j = i*i;
			while (j<=n) {
				ip[j] = i;
				j = i + j;
			}
		}
	for (int i = 2; i<=n; i++)
		if (ip[i]==0)
			p[++num] = i;
}
int main() {
	int n, res;
	sieve(100000);
	while (true) {
		cin>>n;
		res = 0;
		if (0==n)
			break;
		int j, temp;
		for (int i = 1; p[i]<=n; i++) {
			j = i;
			temp = n;
			while (n-p[j]>=0) {
				n = n-p[j++];
			}
			if (n==0)
				res++;
			n = temp;
		}
		cout<<res<<endl;
	}
	return 0;
}
