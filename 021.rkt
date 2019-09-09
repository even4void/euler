#lang racket

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
