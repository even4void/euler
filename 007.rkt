#lang racket

;; Problem 7
;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
;; What is the 10 001st prime number?
;; https://projecteuler.net/problem=7

(require math/number-theory)

;; FIXME Implement a proper sieve or maybe Miller-Rabin primality test
;; to replace built-in `prime?'

(define *limit* 1000000)

(define (sol-007 [n 10000])
  (list-ref (filter prime? (range 1 *limit*)) n))

(sol-007)
