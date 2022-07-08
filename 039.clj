#!/usr/bin/env clj

(defn sqr [x] (* x x))

(defn sqr? [n] (let [x (Math/sqrt n)] (== (int x) x)))

(defn triplets
  [p]
  (for [a (range 3 (inc (quot p 4)))
        b (range (inc a) (quot p 2))
        :let [a+b (+ (sqr a) (sqr b))
              c (int (Math/sqrt a+b))]
        :when (sqr? a+b)]
    (reduce + [a b c])))

(defn sol-039
  [p]
  (->> (triplets p)
       frequencies
       (sort-by second)
       last))

(println (sol-039 1000))
