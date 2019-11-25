#! /usr/bin/env clj

(defn sol-045 []
  (first
   (for [n (iterate inc 286)
         :let [t (/ (* n (inc n)) 2)
               pt (/ (+ 1/2 (Math/sqrt (+ 1/4 (* 6 t)))) 3)
               ht (/ (+ 1 (Math/sqrt (inc (* 8 t)))) 4)]
         :when (and (== pt (int pt)) (== ht (int ht)))]
     t)))

(println (sol-045))
