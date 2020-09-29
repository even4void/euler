#!/usr/bin/env python3

# Credit: https://blog.dreamshire.com/project-euler-38-solution/


def pandigital(n, s=9):
    n = str(n)
    return len(n) == s and not "1234567890"[:s].strip(n)


for n in range(9487, 9213, -1):
    p = str(n * 1) + str(n * 2)
    if pandigital(p):
        print(p)
