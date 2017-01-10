#include <cstdio>
#include <queue>

#define  oo  1000000000000000

using namespace std;

struct strHeap {
    int u;
    long long cost, numcake;
    bool operator()(strHeap a, strHeap b) {
        if (a.cost > b.cost)
            return true;
        if (a.cost < b.cost)
            return false;
        if (a.numcake < b.numcake)
            return true;
        else return false;
    }
};

int n, m, u, v;
long long c, f[100001], bestlen = oo, bestcake = 0, cake[100001];
strHeap ff[100001];
bool check1 = true, visit[100001], check2 = true;

vector <pair<int, long long> > adj[100001];

priority_queue <pair<long long, int> > heap1;
priority_queue <strHeap, vector<strHeap>, strHeap> heap3;


void sub1() {
    heap1.push(make_pair(0, 1));
    for (int i = 1; i<=n; i++)
        f[i] = oo;
    f[1] = 0;
    pair <long long, int> q;
    while (!heap1.empty()) {
        q = heap1.top(); heap1.pop();
        if (f[q.second] < -q.first)
            continue;
        for (unsigned int i = 0; i<adj[q.second].size(); i++) {
            if (-q.first + adj[q.second][i].second < f[adj[q.second][i].first]) {
                f[adj[q.second][i].first] = -q.first + adj[q.second][i].second;
                heap1.push(make_pair(-f[adj[q.second][i].first], adj[q.second][i].first));
            }
//            f[adj[q.second][i].first] = min(f[adj[q.second][i].first], -q.first + adj[q.second][i].second);
        }
    }
    if (f[n] == oo)
        printf("impossible");
    else
        printf("%lld 0", f[n]);
}

void dfs(int u, long long c, long long cost, bool update) {
    visit[u] = true;
    if (u == n) {
        if (cost <= bestlen) {
            bestlen = cost;
            if (update) {
                bestcake = max(bestcake, c);
            }
        }
        visit[u] = false;
        return;
    }
    for (int i = 0; i<adj[u].size(); i++)
    if (!visit[adj[u][i].first]) {
        if (cost + adj[u][i].second <= bestlen)
            dfs(adj[u][i].first, c + cake[adj[u][i].first], cost + adj[u][i].second, update);
    }
    visit[u] = false;
}

void sub2() {
    dfs(1, cake[1], 0, false);
    dfs(1, cake[1], 0, true);
    if (bestlen == oo)
        printf("impossible");
    else
        printf("%lld %lld", bestlen, bestcake);
}

strHeap make_element(int u, long long cost, long long c) {
    strHeap r;
    r.u = u;
    r.cost = cost;
    r.numcake = c;
    return r;
}

void sub3() {
    while (!heap3.empty())
        heap3.pop();
    for (int i = 1; i<=n; i++) {
        ff[i].cost = oo;
        ff[i].numcake = 0;
    }
    ff[1].cost = 0;
    heap3.push(make_element(1, ff[1].cost, cake[1]));
    strHeap q;
    while (!heap3.empty()) {
        q = heap3.top();
        heap3.pop();
        if (q.cost > ff[q.u].cost)
            continue;
        if (q.cost == ff[q.u].cost && q.numcake < ff[q.u].numcake)
            continue;
        for (unsigned int j = 0; j<adj[q.u].size(); j++) {
            int v = adj[q.u][j].first;
            if (ff[v].cost > q.cost + adj[q.u][j].second) {
                ff[v].cost = q.cost + adj[q.u][j].second;
                ff[v].numcake = q.numcake + cake[v];
                heap3.push(make_element(v, ff[v].cost, ff[v].numcake));
            } else
            if (ff[v].cost == q.cost + adj[q.u][j].second) {
                ff[v].numcake = max(ff[v].numcake, q.numcake + cake[v]);
                heap3.push(make_element(v, ff[v].cost, ff[v].numcake));
            }
        }
    }
    if (ff[n].cost == oo)
        printf("impossible");
    else
        printf("%lld %lld", ff[n].cost, ff[n].numcake);
}

int main() {
    #ifndef ONLINE_JUDGE
    freopen("vo17phd.inp", "r", stdin);
    freopen("vo17phd.out", "w", stdout);
    #endif // ONLINE_JUDGE
    scanf("%d", &n);
    for (int i = 1; i<=n; i++) {
        scanf("%d", &cake[i]);
        if (cake[i] != 0)
            check1 = false;
    }
    scanf("%d", &m);
    for (int i = 1; i<=m; i++) {
        scanf("%d%d%lld", &u, &v, &c);
        if (c!=1)
            check2 = false;
        adj[u].push_back(make_pair(v, c));
        adj[v].push_back(make_pair(u, c));
    }
//    if (check1)
//        sub1();
//    else if (check2)
//        sub2();
//    else
        sub3();
    return 0;
}
