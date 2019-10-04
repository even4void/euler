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

(require math/number-theory)

;; https://stackoverflow.com/a/20320352
;; (define (permutations s)
;;   (cond [(empty? s) empty]
;;         [(empty? (rest s)) (list s)]
;;         [else
;;          (let splice [(l '()) (m (first s)) (r (rest s))]
;;            (append
;;             (map (lambda (x) (cons m x))
;;                  (permutations (append l r)))
;;             (if (empty? r)
;;                 empty
;;                 (splice (cons m l) (car r) (cdr r)))))]))

(define (nth lst counter)
  (cond [(null? lst) '()]
        [(= counter 0) lst]
        [else (nth (rest lst) (- counter 1))]))

;; translated from CL code found at
(define (get-nth-permutation n l)
  (if (= 1 (length l))
      (if (= n 0)
          l
          (error "NaN"))
      (let perm-count [(factorial (sub1 (length l)))]
        (let-values ([(num-perms rem) (quotient/remainder n perm-count)])
          (append (list (nth num-perms l)) (get-nth-permutation rem (remove (nth num-perms l) l)))))))

(define (sol-024 [n 1000000])
  (get-nth-permutation (sub1 n) (range 0 9)))

(sol-024)
