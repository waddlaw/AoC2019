module Main where

import Data.List

solve' :: Int -> Int
solve' n = (n `div` 3) - 2

solve :: Int -> Int
solve = sum . takeWhile (>=0) . tail . iterate solve'

solve2 :: Int -> Int
solve2 = sum . unfoldr go
  where
    go b | let n = solve' b = if n <= 0 then Nothing else Just (n, n)

main :: IO ()
main = do
  content <- readFile "input.txt"
  print $ sum $ map (solve . read) $ lines content
