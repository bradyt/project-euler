# 10001st prime
# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6th prime is 13.
#
# What is the 10,001st prime number?

import genprimes

def nth_prime(n):
    primes = genprimes.genPrimes()
    for _ in range(n - 1):
        next(primes)
    return next(primes)

def p007():
    return nth_prime(10001)

def main():
    print(p007())

if __name__ == '__main__':
    main()
