#lang racket

;; Problem 24
;; A permutation is an ordered arrangement of objects. For example, 3124 is one
;; possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
;; are listed numerically or alphabetically, we call it lexicographic order. The
;; lexicographic permutations of 0, 1 and 2 are:
;; 012   021   102   120   201   210
;; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
;; 6, 7, 8 and 9?
;; https://projecteuler.net/problem=24

;; FIXME not very efficient and `list-ref' doesn't work with such large numbers

;; https://stackoverflow.com/a/20320352
(define (permutations s)
  (cond [(empty? s) empty]
        [(empty? (rest s)) (list s)]
        [else
         (let splice [(l '()) (m (first s)) (r (rest s))]
           (append
            (map (lambda (x) (cons m x))
                 (permutations (append l r)))
            (if (empty? r)
                empty
                (splice (cons m l) (car r) (cdr r)))))]))

(define (sol-024 [n 10])
  (list-ref (permutations (range (add1 n))) (sub1 100000)))

(sol-024)
