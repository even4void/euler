#lang racket

;; Problem 15
;; Starting in the top left corner of a 2×2 grid, and only being able to move
;; to the right and down, there are exactly 6 routes to the bottom right corner.
;; How many such routes are there through a 20×20 grid?
;; https://projecteuler.net/problem=15

(define (reduce f xs)
  (and (not (empty? xs)) (foldl f (first xs) (rest xs))))

(define (f n)
  (reduce (lambda (x y) (* x y)) (range 1 (add1 n))))

(define (sol-015 [n 20])
  (ceiling (/ (f (* n 2)) (f n) (f n))))

(sol-015)
