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
