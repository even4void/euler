#lang racket

(require math/number-theory)

(define (safe-prime? n)
  (and (> n 0) (prime? n)))

(define (consecutive-primes quadratic)
  (let loop ([n 0])
    (if (safe-prime? (quadratic n))
        (loop (add1 n))
        n)))

;; Credit: Eric Hanchrow (https://github.com/offby1/project-euler)

(define-values (best length)
    (for*/fold ([best? #f]
                [length 0])
        ([a (in-range -1000 1000)]
         [b (in-range -1000 1000)])
      (define (quadratic n)
        (+ (* n n)
           (* n a)
           b))
      (let ((len (consecutive-primes quadratic)))
        (if (< length len)
            (values (list a b) len)
            (values best? length)))))

(apply * best)
