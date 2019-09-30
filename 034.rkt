#lang racket

;; Problem 34
;; 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
;; Find the sum of all numbers which are equal to the sum of
;; the factorial of their digits. Note: as 1! = 1 and 2! = 2
;; are not sums they are not included.
;; https://projecteuler.net/problem=34

(require math)

(define (digits n)
  (if (zero? n)
      null
      (cons (remainder n 10) (digits (quotient n 10)))))

(define f (map factorial (range 10)))

(define (digit-sum n)
  (apply + (map (lambda (x) (list-ref f x))
              (digits n))))

(define (sol-034)
  (apply + (for/list ([i (in-range 11 2400000)]
	      #:when (= i (digit-sum i)))
     i)))

(sol-034)
