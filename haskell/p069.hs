
-- Totient maximum

import Math.NumberTheory.Primes

-- lucky guess? 

-- (<10^6) $ product $ flip take primes 7
-- 7 is first number of primes that have product less than 1000000

p069 = product $ flip take primes 7
-- 510510

main = print p069
