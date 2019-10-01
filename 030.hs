#! /usr/bin/env stack
-- stack --resolver lts-13.26 script

import Data.Char

isPowerSum :: Int -> Int -> Bool
isPowerSum p n = n == sum (map (^p) digits)
    where digits = map digitToInt (show n)

powerSumsOf :: Int -> [Int]
powerSumsOf p = scanl (+) 0 powerSums
    where powerSums = filter (isPowerSum p) [2..]


