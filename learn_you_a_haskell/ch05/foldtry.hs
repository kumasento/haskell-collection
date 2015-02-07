maximum' :: (Ord a) -> [a] -> a
maximum' = foldl1 (\acc x->if acc < x then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x->x:acc) []

product' :: (Num a) -> [a] -> a
product' = foldl1 (*)

filter' :: (a->Bool)->[a]->[a]
filter' p = foldr (\x acc->if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)


