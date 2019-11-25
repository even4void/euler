#lang racket

(require math/number-theory)

(define (digits x)
  (if (zero? x)
      null
      (cons (remainder x 10) (digits (quotient x 10)))))

(define (num-digits n)
  (let loop ([ret 0] [n n])
    (if (= n 0)
	ret
	(loop (add1 ret) (quotient n 10)))))

(define (circular-primes n)
  (define len (num-digits n))
  (define power (expt 10 (sub1 len)))
  (let rec ([cur n] [i len] [ret '()])
    (let-values ([(q r) (quotient/remainder cur 10)])
      (define next (+ q (* r power)))
      (if (<= i 1)
	  ret
	  (rec next (sub1 i) (cons next ret))))))

(define (circular-prime? n)
  (or (< n 10)
      (andmap prime? (circular-primes n))))

(define (odds? n)
  (not (memq 2 (reverse (digits n)))))

(define (sol-035)
  (+ 1 (length
    (filter (lambda (x) (and (odds? x) (circular-prime? x)))
	    (filter prime? (range 1 1000000)))))

(sol-035)

