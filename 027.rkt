#lang racket

(define safe-prime? (n)
  (and (> n 0) (prime? n)))

