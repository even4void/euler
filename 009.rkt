#lang racket

;; Problem 9
;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;; a2 + b2 = c2
;; For example, 32 + 42 = 9 + 16 = 25 = 52.
;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.
;; https://projecteuler.net/problem=9

(define (pythagorean? x)
  (equal? (+ (sqr (car x)) (sqr (cadr x))) (sqr (last x))))

(define (sol-009 n)
  (for*/list ([a (in-range (floor (/ (add1 n) 3)) 0 -1)]
              [b (in-range (floor (/ (add1 n) 2)) a -1)])
    (let* ([c (- n a b)])
          (list a b c (pythagorean? (list a b c))))))

(filter (lambda (x) (equal? (last x) #t)) (sol-009 1000))
