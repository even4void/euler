#! /usr/bin/env stack
-- stack --resolver lts-16.26 script

main :: IO ()
main = print $ maximum $ factorize 600851475143

primes :: [Integer]
primes = sieve [2..] where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

factorize :: Integer -> [Integer]
factorize n = primeFactors n primes where
    primeFactors 1 _ = []
    primeFactors m (p:ps) | m < p * p = [m]
                          | r == 0 = p : primeFactors q (p:ps)
                          | otherwise = primeFactors m ps
                          where (q, r) = quotRem m p
