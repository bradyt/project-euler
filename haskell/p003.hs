-- Largest prime factor
-- Problem 3

-- The prime factors of 13195 are 5, 7, 13 and 29.

-- What is the largest prime factor of the number 600851475143 ?

import Math.NumberTheory.Primes

p003 = fst . maximum $ factorise 600851475143

main = print p003
