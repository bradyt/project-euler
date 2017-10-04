#!/usr/bin/python3
# Summation of primes
# Problem 10

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# references:
# https://en.wikipedia.org/wiki/Generating_primes
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes


# Input: an integer n > 1.
#
# Let A be an array of Boolean values, indexed by integers 2 to n,
# initially all set to true.
#
# for i = 2, 3, 4, ..., not exceeding √n:
#   if A[i] is true:
#     for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n:
#       A[j] := false.
#
# Output: all i such that A[i] is true.

# import genprimes

import math
# import genprimes

two_mil = 2 * 10 ** 6
upper_limit = int(math.sqrt(two_mil))

def sieve(n):
    A = [True] * (n + 1)
    A[0] = False
    A[1] = False
    upper_limit = math.sqrt(n)
    i = 2
    while i <= upper_limit:
        if A[i] == True:
            j = i ** 2
            while j <= n:
                A[j] = False
                j += i
        i += 1
    return A
            
def main(n):
    A = sieve(n)
    return sum([i for i in range(2, n)
                if A[i] == True])

    # return sum(
    # while i < n:
    #     if A[i] == True:
    #         s += i
    #     i += 1
    # return s


def segment(n):
    delta = upper_limit

    
if __name__ == '__main__':
    main()

# outline:
# build a dict up to sqrt n
# after reaching sqrt n, simply add all elements
#
# 

# def genPrimes():
#     n = 2
#     s = 0
#     notPrime = {}
#     while n < two_mil:
#         if n in notPrime:
#             primes = notPrime.pop(n)
#             for p in primes:
#                 notPrime.setdefault(n + p, []).append(p)
#         else:
#             notPrime[n * n] = [n]
#             s += n
#         n += 1
#     return s

# def test_genPrimes():
#     primes = genPrimes()
#     assert next(primes) == 2
#     assert next(primes) == 3
#     assert next(primes) == 5

# test_genPrimes()
# def p010():
#     primes = genprimes.genPrimes()
#     next_prime = next(primes)
#     s = 0
#     while next_prime < two_mil:
#         s += next_prime
#         next_prime = next(primes)
#     return s

# # array = [True] * two_mil
# # array[0] = False
# # array[1] = False

# # i = 2
# # while i < two_mil:
# #     if array[i] == False:
# #         continue
# #     j = i ** 2
# #     while j < two_mil:
# #         array[j] = False
# #         j += i
# #     i += 1

# # print('almost done')

# # print(sum(array))



# # import Math.NumberTheory.Primes

# # problem10 :: Integer
# # problem10 = sum $ takeWhile (< 2 * 10^6) primes

# # main = print problem10
