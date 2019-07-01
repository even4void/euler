#lang racket

;; Problem 3
;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143 ?
;; https://projecteuler.net/problem=3

(require math)

(define (largest-prime-factor x)
 (apply max (map car (factorize x))))

(define (sol-003 (n 600851475143))
  (largest-prime-factor n))

(sol-003)

