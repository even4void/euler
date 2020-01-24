#!/usr/bin/env python3

import re
from sympy import isprime

DEBUG = True


def istrunc(n):
    for d in range(1, len(str(n))):
        if not isprime(int(str(n)[d:])) or not isprime(int(str(n)[:d])):
            return False
    return True


n, f = 11, 1
bag = []

while len(bag) < 11:
    n += 3-f
    f = -f
    # if any digit is in the set {2, 4, 5, 6, 8, 0} for a prime number > 100,
    # then it will yield a composite number when truncated.
    # Credit: https://blog.dreamshire.com/project-euler-37-solution/
    if not (n > 100 and re.search('[245680]', str(n))):
        if isprime(n) and istrunc(n):
            if DEBUG:
                print(n)
            bag.append(n)

print(sum(bag))
