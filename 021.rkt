#lang racket

;; Problem 21
;; Let d(n) be defined as the sum of proper divisors of n (numbers
;; less than n which divide evenly into n).
;; If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable
;; pair and each of a and b are called amicable numbers.
;; For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
;; 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284
;; are 1, 2, 4, 71 and 142; so d(284) = 220.
;; Evaluate the sum of all the amicable numbers under 10000.
;; https://projecteuler.net/problem=21

(define (divisor-sum n)
  (for/sum ([i (in-range 1 (add1 (quotient n 2)))]
            #:when (zero? (remainder n i)))
    i))

(define (amicable? n)
  (define s (divisor-sum n))
  (and (not (= n s))
       (= n (divisor-sum s))))

(define (pair-sum p)
  (+ (car p) (cdr p)))

;; Credits: https://stackoverflow.com/a/23711209 (Chris Jester-Young)
(define (amicable-peer n)
  (define sum (divisor-sum n))
  (and (not (= n sum))
       (= n (divisor-sum sum))
       sum))

(define (amicable-pairs-between m n)
  (for*/list ((i (in-range m (add1 n)))
              (peer (in-value (amicable-peer i)))
              #:when (and peer (<= m peer n) (< i peer)))
    (cons i peer)))

(apply + (for/list ([elt (in-list (amicable-pairs-between 0 10000))]) (pair-sum elt)))
