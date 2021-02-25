from itertools import compress

from sympy import primerange


def is_pandigital(n):
    n = str(n)
    s = len(n)
    return len(n) == s and not "1234567890"[:s].strip(n)


# Let's go for brute force: Generate primes from 2 to 987654321
# and find the largest pandigital number.

xs = list(primerange(2, 987654321))
ps_bool = [is_pandigital(x) for x in xs]
ix = list(compress(range(len(ps_bool)), ps_bool))
values = [x for i, x in enumerate(xs) if i in ix]
print(max(values))
