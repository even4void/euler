#!/usr/bin/env python3

val = 0
for i in range(1, 1001):
    val += i**i
print(int(repr(val)[-10:]))
