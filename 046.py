#!/usr/bin/env python3

n = 5
f = 1
pp = set()

while True:
    if all(n % p for p in pp):
        pp.add(n)
    else:
        if not any((n - 2 * i * i) in pp for i in range(1, n)):
            break
    n += 3 - f
    f = -f

print(n)
