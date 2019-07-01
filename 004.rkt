#lang racket

;; Problem 4
;; A palindromic number reads the same both ways. The largest palindrome made
;; from the product of two 2-digit numbers is 9009 = 91 × 99.
;; Find the largest palindrome made from the product of two 3-digit numbers.
;; https://projecteuler.net/problem=4

(define (rev-string str)
  (list->string (reverse (string->list str))))

(define (palindrome? x)
    (equal? (number->string x) (rev-string (number->string x))))

(define (sol-004)
  (apply max
         (for*/list ([a (in-range 999 100 -1)]
                     [b (in-range a 100 -1)]
                     #:when (palindrome? (* a b)))
           (* a b))))

(sol-004)


