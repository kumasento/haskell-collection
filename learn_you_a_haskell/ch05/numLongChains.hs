numLongChains :: Int 
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
