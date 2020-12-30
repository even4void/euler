#! /usr/bin/env stack
-- stack --resolver lts-16.26 script

main :: IO ()
main = print r

r :: Integer
r = sum $ filter even $ takeWhile (< 4000000) fib

-- https://is.gd/NS9tqM
fib :: [Integer]
fib = 1 : 2 : zipWith (+) fib (tail fib)
