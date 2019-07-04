#lang racket

;; Problem 6
;; The sum of the squares of the first ten natural numbers is,
;; 12 + 22 + ... + 102 = 385
;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)2 = 552 = 3025
;; Hence the difference between the sum of the squares of the first ten natural numbers
;; and the square of the sum is 3025 − 385 = 2640.
;; Find the difference between the sum of the squares of the first one hundred natural
;; numbers and the square of the sum.
;; https://projecteuler.net/problem=6

(define (sol-006)
  (let* ([x (range 1 101)]
         [sum-of-squares (apply + (map sqr x))]
         [square-of-sum (sqr (apply + x))])
    (- square-of-sum sum-of-squares)))

(sol-006)