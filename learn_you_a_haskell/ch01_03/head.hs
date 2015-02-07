head' :: [a]->a
head' [] = error "Cant call head on an empty list"
head' (x:_) = x

