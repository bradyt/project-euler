sum_to_n () {
    echo 'hello'
}

p001 () {
    return 35
}

main () {
    x = p001
    echo $x
}

main

# sumToN :: Integral a => a -> a
# sumToN n = n * (n + 1) `div` 2

# sumMultiplesToN :: Integral a => a -> a -> a
# sumMultiplesToN n m = (m *) . sumToN $ n `div` m

# sumOfMultiplesOf3And5 :: Integral a => a
# sumOfMultiplesOf3And5 = map (sumMultiplesToN 999) [3, 5, 15]
#   & (\[x, y, z] -> x + y - z)

# main :: IO ()
# main = print sumOfMultiplesOf3And5
