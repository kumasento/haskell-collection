import Data.Array.Accelerate

dotp :: Acc (Vector Float) -> Acc (Vector Float) -> Acc (Vector Float)
dotp xs ys = fold (+) 0 (Data.Array.Accelerate.zipWith (*) xs ys)
