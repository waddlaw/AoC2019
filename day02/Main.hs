{-# LANGUAGE LambdaCase #-}
module Main where

import Data.Array.MArray
import Data.Array.IO
import Data.Array.IArray (Array, (!), elems)

type Pos = Int

solve :: [Int] -> IO Int
solve xs = do
    arr <- newListArray (0, n) xs
    run 0 arr
    arr' <- freeze arr :: IO (Array Int Int)
    return (arr' ! 0)
  where
    n = length xs - 1

run :: Pos -> IOArray Int Int -> IO ()
run pos arr = do
  let
    next = (+4) 
    process op = do
      v1 <- indirectRead arr (pos+1)
      v2 <- indirectRead arr (pos+2)
      indirectWrite arr (pos+3) (v1 `op` v2)
      run (next pos) arr

  readArray arr pos >>= \case
    1  -> process (+)
    2  -> process (*)
    99 -> return ()

indirectRead :: IOArray Int Int -> Pos -> IO Int
indirectRead arr pos = readArray arr pos >>= readArray arr

indirectWrite :: IOArray Int Int -> Pos -> Int -> IO ()
indirectWrite arr pos v = do
  pos' <- readArray arr pos
  writeArray arr pos' v

main :: IO ()
main = do
  result <- solve problem
  print result

ex1, ex2, ex3, ex4 :: [Int]
ex1 = [1,0,0,0,99]
ex2 = [2,3,0,3,99]
ex3 = [2,4,4,5,99,0]
ex4 = [1,1,1,4,99,5,6,0,99]

problem :: [Int]
problem = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,6,23,2,13,23,27,1,27,13,31,1,9,31,35,1,35,9,39,1,39,5,43,2,6,43,47,1,47,6,51,2,51,9,55,2,55,13,59,1,59,6,63,1,10,63,67,2,67,9,71,2,6,71,75,1,75,5,79,2,79,10,83,1,5,83,87,2,9,87,91,1,5,91,95,2,13,95,99,1,99,10,103,1,103,2,107,1,107,6,0,99,2,14,0,0]