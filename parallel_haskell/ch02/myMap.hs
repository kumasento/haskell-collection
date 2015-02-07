myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

testFun x = 2 * x
