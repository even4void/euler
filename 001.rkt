#lang racket

;; Problem 1
;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.
;; https://projecteuler.net/problem=1

(define (sol-001 (limit 1000))
  (apply +
    (for/list ([x (in-range 1000)]
      #:when (or (= (modulo x 3) 0)
                 (= (modulo x 5) 0)))
     x)))

(sol-001)
