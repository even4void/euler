#lang racket

(require math/number-theory)

(define (lrcdf q)
  (if (coprime? 10 q)
      (unit-group-order 10 q)
      0))


(for/fold ([p '(0 . 0)])
    ([x (in-range 2 1000)])
    (let ([l (lrcdf x)])
      (if (< (cdr p) l)
          (cons x l)
          p)))

