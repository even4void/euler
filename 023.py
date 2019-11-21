#!/usr/bin/env python3

nmax = 28123
S = [1] * (nmax + 1)

for i in range(2, int(nmax ** 0.5) + 1):
    S[i * i] += i
    for k in range(i + 1, nmax // i + 1):
        S[k * i] += k + i

lst = set()
res = 0

for n in range(1, nmax + 1):
    if S[n] > n:
        lst.add(n)

    if not any((n - a in lst) for a in lst):
        res += n

print(res)
