module Main where

import Gauge

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
main =
  defaultMainWith (defaultConfig {displayMode=Condensed})
    [ bgroup "solve"
        [ bench "n=14"     $ nf solve 14
        , bench "n=1969"   $ nf solve 1969
        , bench "n=100756" $ nf solve 100756
        ]
    , bgroup "solve2"
        [ bench "n=14"     $ nf solve2 14
        , bench "n=1969"   $ nf solve2 1969
        , bench "n=100756" $ nf solve2 100756
        ]
    ]

{-
solve/n=14                               mean 98.84 ns  ( +- 37.71 ns  )
solve/n=1969                             mean 231.1 ns  ( +- 23.05 ns  )
solve/n=100756                           mean 430.6 ns  ( +- 62.10 ns  )

solve2/n=14                              mean 49.88 ns  ( +- 7.288 ns  )
solve2/n=1969                            mean 115.0 ns  ( +- 8.335 ns  )
solve2/n=100756                          mean 202.0 ns  ( +- 72.38 ns  )
-}