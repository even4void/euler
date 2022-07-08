#!/usr/bin/env clj

(defn mult
  [xs]
  (reduce * xs))

(defn expt
  [a m]
  (if (zero? m)
    1
    (* a (expt a (dec m)))))

;; FIXME Rewrite without loop
(defn digits
  [n]
  (loop [i n res '()]
    (if (< i 10)
      (cons i res)
      (recur (quot i 10)
             (cons (rem i 10)
                   res)))))

(defn sol-040
  [n]
  (->> (range (inc n))
     (map #(expt 10 %))
     (map #(nth (mapcat digits (iterate inc 1))
                (dec %)))
     mult))

(println (sol-040 6))
