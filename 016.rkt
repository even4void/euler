#lang racket

;; Problem 16
;; 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;; What is the sum of the digits of the number 21000?
;; https://projecteuler.net/problem=16

(define (digits x)
  (if (zero? x)
      null
      (cons (remainder x 10) (digits (quotient x 10)))))

(apply + (digits (expt 2 1000)))
