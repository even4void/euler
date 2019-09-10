#lang racket

;; Problem 25
;; The 12th term, F12, is the first term to contain three digits.
;; What is the index of the first term in the Fibonacci sequence
;; to contain 1000 digits?
;; https://projecteuler.net/problem=25

;; NOTE Some nice Clojure code here: https://is.gd/PxMObM

(define (length n)
    (inexact->exact (+ 1 (floor (/ (log n) (log 10))))))

(define phi (/ (add1 (inexact->exact (sqrt 5))) 2))

(define (fibo n) (round (/ (expt phi n) (inexact->exact (sqrt 5)))))

;; More efficient version
;; https://programmingpraxis.com/2010/07/30/fibonacci-numbers/
(define (fib n)
  (define (square x) (* x x))
  (cond ((zero? n) 0) ((or (= n 1) (= n 2)) 1)
        ((even? n) (let* ((n2 (quotient n 2)) (n2-1 (- n2 1)))
                     (* (fib n2) (+ (* 2 (fib n2-1)) (fib n2)))))
        (else (let* ((n2-1 (quotient n 2)) (n2 (+ n2-1 1)))
                (+ (square (fib n2-1)) (square (fib n2)))))))

(last (for/list ([i (in-range 1000 10000)]
      #:final (= (length (fib i)) 1000))
  (list i)))
