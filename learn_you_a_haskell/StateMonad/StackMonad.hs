module StackMonad where

import Control.Monad.State

type Stack = [Int]

pop :: State Stack Int
pop = state $ \(x:xs)->(x, xs)

push :: Int -> State Stack ()
push x = state $ \xs->((), (x:xs))

stackManip :: State Stack Int
stackManip = do
    push 3
    pop
    pop

stackStuff :: State Stack ()
stackStuff = do
    a <- pop
    if a == 5
        then push 5
        else do
            push 3
            push 8

stackyStack :: State Stack ()
stackyStack = do
    stackNow <- get
    if stackNow == [1,2,3]
        then put [8,3,1]
        else put [9,2,1]
