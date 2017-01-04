# Summation of primes
# Problem 10

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# import genprimes

import math

# def p010():
#     primes = genprimes.genPrimes()
#     next_prime = next(primes)
#     s = 0
#     while next_prime < 2 * 10 ** 6:
#         s += next_prime
#         next_prime = next(primes)
#     return s

two_mil = 2 * 10 ** 6

upper_limit = int(math.sqrt(two_mil))

array = [True] * two_mil
array[0] = False
array[1] = False

i = 2
while i < two_mil:
    if array[i] == False:
        continue
    j = i ** 2
    while j < two_mil:
        array[j] = False
        j += i
    i += 1

print('almost done')

print(sum(array))



# import Math.NumberTheory.Primes

# problem10 :: Integer
# problem10 = sum $ takeWhile (< 2 * 10^6) primes

# main = print problem10
