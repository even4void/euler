#!/usr/bin/env python3

import math


def is_pentagonal(n):
    """ Determine if n is a pentagonal number. """
    n = (math.sqrt(1 + 24*n) + 1) / 6
    return n == int(n)


r, i = 0, 1

while True:
    i += 1
    n = i * (3*i - 1) // 2
    j = i - 1
    while j > 0:
        print(j)
        m = j * (3*j - 1) // 2
        j -= 1
        if is_pentagonal(n - m) and is_pentagonal(n + m):
            r = n - m
            break

print(r)
