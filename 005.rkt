#lang racket

;; Problem 5
;; 2520 is the smallest number that can be divided by each of the numbers 
;; from 1 to 10 without any remainder.
;; What is the smallest positive number that is evenly divisible by all 
;; of the numbers from 1 to 20?
;; https://projecteuler.net/problem=5

(define (lcm-up-to n)
  (for/fold ([res 1])
            ([i (in-range 1 (+ n 1))])
    (lcm res i)))

(define (sol-005 (n 20))
  (lcm-up-to n))

(sol-005)
