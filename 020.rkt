#lang racket

;; Problem 20
;; n! means n × (n − 1) × ... × 3 × 2 × 1
;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
;; Find the sum of the digits in the number 100!
;; https://projecteuler.net/problem=20

(define (digits x)
  (if (zero? x)
      null
      (cons (remainder x 10) (digits (quotient x 10)))))

(define factorial
  (lambda (n acc)
    (if (= n 0)
        acc
        (factorial (- n 1)  (* acc n )))))

(define (sol-020)
  (apply + (digits (factorial 100 1))))

(sol-020)
