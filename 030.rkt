#lang racket

;; Problem 30
;; Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
;; 1634 = 14 + 64 + 34 + 44
;; 8208 = 84 + 24 + 04 + 84
;; 9474 = 94 + 44 + 74 + 44
;; As 1 = 14 is not a sum it is not included.
;; The sum of these numbers is 1634 + 8208 + 9474 = 19316.
;; Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
;; https://projecteuler.net/problem=30

(define (digits x)
  (if (zero? x)
      null
      (cons (remainder x 10)
            (digits (quotient x 10)))))

(define powers-of-five
  (map (lambda (x) (expt x 5)) (range 10)))

(define (sum-of-power n)
  (apply + (map (lambda (x) (list-ref powers-of-five x))
		(digits n))))

(define (sol-030)
  (apply + (for/list ([i (in-range 1000 360000)]
                      #:when (= i (sum-of-power i)))
             i)))

(sol-030)
