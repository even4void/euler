#! /usr/bin/env python3

from itertools import islice


def psieve():
    """ https://stackoverflow.com/a/19391111 """
    import itertools
    yield from (2, 3, 5, 7)
    D = {}
    ps = psieve()
    next(ps)
    p = next(ps)
    assert p == 3
    psq = p*p
    for i in itertools.count(9, 2):
        if i in D:      # composite
            step = D.pop(i)
        elif i < psq:   # prime
            yield i
            continue
        else:           # composite, = p*p
            assert i == psq
            step = 2*p
            p = next(ps)
            psq = p*p
        i += step
        while i in D:
            i += step
        D[i] = step


def rotate(s):
    return [s[n:] + s[:n] for n in range(1, len(s))]


n = 1000000
s = set('024568')

g = psieve()

primes = set(['2', '5'] + [str(p) for p in [next(g) for _ in range(n)]   # next(islice(psieve(), L, None))
                           if not set(str(p)).intersection(s)])

count = sum(all(pr in primes for pr in rotate(p)) for p in primes)

print(count)
