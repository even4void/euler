#! /usr/bin/env stack
-- stack --resolver lts-13.26 script

-- every four elements the skips until the next valid element increases by 2.
-- each row adds 4 more elements and are of odd length.
-- total elements to obtain = 1 + (4 * (side / 2))

-- Credit: Mr Axilus (no longer available on GH)

r :: Int
r = sum $ take (spdiagin 1001) spdiag

spdiagin :: Int -> Int
spdiagin s = 1 + (4 * (s `div` 2))

spdiag :: [Int]
spdiag = spdiag' 0 0

spdiag' :: Int -> Int -> [Int]
spdiag' 0 _    = 1 : spdiag' 1 2
spdiag' i skip = spiral ++ spdiag' (last spiral) (skip + 2)
    where spiral = take 4 [x | x <- [i + skip, i + (skip * 2)..]]
