{-# LANGUAGE TupleSections #-}
module Lib (displayIrrepsPartitions) where

import Control.Monad (forM_)
import Math.Combinat.Partitions.Integer (partitions, toExponentialForm, fromPartition)
import Data.List (sortOn)


partitionLists :: Int -> Int -> [[(Int, Int)]]
partitionLists a = map (map (a,) . fromPartition) . partitions

irrepsPartitions :: Int -> [[(Int, Int)]]
irrepsPartitions = map concat . concatMap (productList . map (uncurry partitionLists) . toExponentialForm) . partitions

productList :: [[a]] -> [[a]]
productList [] = [[]]
productList (x:xs) = [y:ys | y <- x, ys <- productList xs]

showPair :: (Int, Int) -> String
showPair (a, b) = show a ++ "^" ++ show b

showPairs :: [(Int, Int)] -> String
showPairs = unwords . map showPair

dimension :: [(Int, Int)] -> Int
dimension = sum . map (\(_, b) -> b * b)

irrepsPartitionsWithDimensions :: Int -> [([(Int, Int)], Int)]
irrepsPartitionsWithDimensions = sortOn snd . map (\l -> (l, dimension l)) . irrepsPartitions

log10 :: Int -> Int
log10 x | x < 10 = 1
        | otherwise = 1 + log10 (x `div` 10)

displayIrrepsPartitions :: Int -> IO ()
displayIrrepsPartitions n = do
  let irreps = irrepsPartitionsWithDimensions n
  forM_ irreps $ \(l, d) -> do
    putStrLn $ show d ++ replicate (12 - log10 d) ' ' ++ showPairs l
  putStrLn $ "Total number of irreps: " ++ show (length irreps)