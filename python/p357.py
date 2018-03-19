# Prime generating integers
# Problem 357
# Consider the divisors of 30: 1,2,3,5,6,10,15,30.
# It can be seen that for every divisor d of 30, d+30/d is prime.

# Find the sum of all positive integers n not exceeding 100,000,000
# such that for every divisor d of n, d+n/d is prime.

# we'll need divisors up to 100,000,000,
# thus we'll need primes up to 100,000,000,
# since for example, a prime is a divisor of itself
# so generate these primes first?
# then, begin finding divisors of each number?
# we can use the existing list to calculate the divisors,
# since otherwise, we can discard it
# then for each combination of its factorization
# indicate if

# generating the list of primes once will be cheap

# but for each number, we need to find list of divisors, and verify
# each satisifes the property.

# finding list of divisors for each number will be expensive.

import primes

array_of_primes = primes.sieve_of_eratosthenes(10 ** 5)

print(array_of_primes[-1])

def check(n, d):
    return is_prime(d + n / d)
