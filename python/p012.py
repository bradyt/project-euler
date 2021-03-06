# Highly divisible triangular number
# Problem 12

# The sequence of triangle numbers is generated by adding the natural
# numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6
# + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#      1: 1
#      3: 1,3
#      6: 1,2,3,6
#     10: 1,2,5,10
#     15: 1,3,5,15
#     21: 1,3,7,21
#     28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five
# divisors.

# What is the value of the first triangle number to have over five
# hundred divisors?

from primes import sieve, trial_division_frequency
from functools import reduce
from itertools import count
from typing import List

def triangular_number(n: int) -> int:
    return n * (n + 1) // 2

def number_of_divisors(primes: List[int], n: int) -> int:
    return reduce(lambda x, y: x * (y + 1),
                  trial_division_frequency(primes, n).values(), 1)

def solution() -> int:
    primes = sieve(2 ** 16)
    for n in count():
        t = triangular_number(n)
        if number_of_divisors(primes, t) > 500:
            return t

def main():
    print(solution())

if __name__ == '__main__':
    main()
