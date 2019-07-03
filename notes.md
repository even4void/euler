# Some notes on Euler problems

## Problem 001

A more elegant solution exploits the fact that we count numbers divisible by 15 twice, when enumerating numbers that are divisible by either 3 or 5.

A little helper function, defined as follows, provides a more efficient way to solve the problem:

```racket
(define (sum-divisible-by n)
    (let* ([limit 1000]
           [p (floor (/ limit n))])
           (/ (* n (* p (add1 p))) 2)))
```

## Problem 002

The conscious reader will [check](https://mathematica.stackexchange.com/q/37266) and [prove](https://math.stackexchange.com/q/2386804) that it is possible to exploit the fact that even numbers occur every three steps, so that we save money on the even-number filter. For the record, the Racket [range](https://docs.racket-lang.org/reference/pairs.html?q=range#%28def._%28%28lib._racket%2Flist..rkt%29._range%29%29) function has everything we need to iterate over a list of numbers using a predefined step.

## Problem 003

The Haskell wiki has some working code for [primality testing](https://wiki.haskell.org/Testing_primality#Primality_Test_and_Integer_Factorization) and the like. Using Racket, Lisp or Python, we don't have to worry working with very large integers. Moreover, Racket has a nice submodule related to number theory in `math`, which simplifies the task to a great extent. Otherwise, we would have to implement prime factorization ourselves (see, e.g., [this gist](https://gist.github.com/dstnbrkr/855700)).

## Problem 004

There are probably many ways to tackle this problem. If we want to treat this like a classical palindrome problem, we need to deal with number-to-string conversion, and then rely on brute-force searching using Racket `for`-loop facilities. The trick is to limit the iteration to numbers ranging from 100 to 999 (and not 0 to 1000 since we want 3-digit number), and to start with larger values as it will increase our chance to find a large palindrome early on. Another nice solution appears at [JP's blog](https://blog.jverkamp.com/2012/11/07/project-euler-4/).

## Problem 005

This is just a brute-force approach, exploiting `for`-loop in Racket and existing algorithm for [generic numerics](https://docs.racket-lang.org/reference/generic-numbers.html). We could roll our own routines to compute `gcd` and `lcm`, e.g.:

```racket
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
(define (lcm a b)
  (/ (abs (* a b)) (gcd a b)))
```

## Problem 006

Again, the Racket doesn't use any optimization trick. However, a clever implementation would use the fact that $1+2+\dots+n = \tfrac{1}{2}n(n+1)$, and $1^2+2^2+\dots+n^2 = \tfrac{1}{6}n(2n+1)(n+1)$. Not sure if we really need to care with infinite precision integers. In any case, those two quantities are well known in applied statistical textbooks, although [Welford's method](https://www.johndcook.com/blog/2008/09/26/comparing-three-methods-of-computing-standard-deviation/) is also a good approach.
