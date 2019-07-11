#lang racket

;; Problem 13
;; Work out the first ten digits of the sum of the following one-hundred
;; 50-digit numbers.
;; https://projecteuler.net/problem=13

(define max 5100)

(define ns
  (map string->number
       (string-split
        (with-input-from-file "013.txt"
          (lambda () (read-string max))))))

;; (define n
;;   (string->number
;;    (string-replace
;;     (with-input-from-file "013.txt"
;;       (lambda () (read-string max))) "\n" "")))

;; take only works with list
(define (n-digits n)
  (+ 1 (floor (/ (log n) (log 10)))))

(define (take-n n [m 10])
  (truncate (/ n (expt 10 (- (n-digits n) m)))))

(inexact->exact (take-n (apply + ns)))
