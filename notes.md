## Problem 001

A more elegant solution exploits the fact that we count numbers divisible by 15 twice, when enumerating numbers that are divisible by either 3 or 5. 

A little helper function, defined as follows, provides a more efficient way to solve the problem:

```racket
(define (sum-divisible-by n)
    (let* ([limit 1000]
           [p (floor (/ limit n))])
           (/ (* n (* p (add1 p))) 2)))
```

