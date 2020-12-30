#! /usr/bin/env stack 
-- stack --resolver lts-16.26 script

main = print r
r = sum [x | x <- [0..999], mod x 3 == 0 || mod x 5 == 0]
