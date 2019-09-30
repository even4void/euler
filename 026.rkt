#lang racket

;; Problem 26
;; A unit fraction contains 1 in the numerator. The decimal representation
;; of the unit fractions with denominators 2 to 10 are given:
;; 1/2	= 	0.5
;; 1/3	= 	0.(3)
;; 1/4	= 	0.25
;; 1/5	= 	0.2
;; 1/6	= 	0.1(6)
;; 1/7	= 	0.(142857)
;; 1/8	= 	0.125
;; 1/9	= 	0.(1)
;; 1/10	= 	0.1
;; Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can
;; be seen that 1/7 has a 6-digit recurring cycle.
;; Find the value of d < 1000 for which 1/d contains the longest recurring
;; cycle in its decimal fraction part.
;; https://projecteuler.net/problem=26

;; Credit: Eric Hanchrow (https://github.com/offby1/project-euler)

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

