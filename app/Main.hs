module Main (main) where

import System.IO

import Lib (displayIrrepsPartitions)

main :: IO ()
main = do
  putStr "Dimension of the representation: "
  hFlush stdout
  input <- getLine
  let n = read input :: Int
  putStrLn $ "Reps of dim " ++ show n ++ ":"
  putStrLn "dim(End)    Type"
  displayIrrepsPartitions n
