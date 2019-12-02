module Main1 where

solve :: Int -> Int
solve n = (n `div` 3) - 2

main :: IO ()
main = do
  content <- readFile "input.txt"
  print $ sum $ map (solve . read) $ lines content