#lang racket

;; Problem 10
;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;; Find the sum of all the primes below two million.
;; https://projecteuler.net/problem=10

(require math/number-theory)

(define (sol-010 [n 2000000])
  (apply + (filter prime? (range 1 n))))

(sol-010)