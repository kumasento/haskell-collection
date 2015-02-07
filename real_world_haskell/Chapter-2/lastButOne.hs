lastButOne xs = if null (tail xs)
    then []
    else (head xs) : lastButOne (tail xs)
