#lang racket

;; Problem 14
;; The following iterative sequence is defined for the set of positive integers:
;; n → n/2 (n is even)
;; n → 3n + 1 (n is odd)
;; Using the rule above and starting with 13, we generate the following sequence:
;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
;; It can be seen that this sequence (starting at 13 and finishing at 1) contains
;; 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
;; that all starting numbers finish at 1.
;; Which starting number, under one million, produces the longest chain?
;; https://projecteuler.net/problem=14

;; https://stackoverflow.com/a/19285747
(define (collatz n)
  (define (collatz-iter n counter)
    (if (<= n 1)
        counter
        (if (even? n)
            (collatz-iter (/ n 2) (add1 counter))
            (collatz-iter (add1 (* n 3)) (add1 counter)))))
  (collatz-iter n 1))

(define (collatz-seq [n 1000000])
  (for/list ([i (in-range n)]) (collatz i)))

(define s (collatz-seq))
(index-of s (apply max s))
