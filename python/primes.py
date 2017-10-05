
import math

# from https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Pseudocode
def sieve_of_eratosthenes(n):
    A = [True] * (n + 1)
    A[0] = False
    A[1] = False
    for i in range(int(math.sqrt(n)) + 1):
        if A[i] == True:
            for j in range(i ** 2, n + 1, i):
                A[j] = False
    return A

def sieve(n):
    A = sieve_of_eratosthenes(n)
    return [ i for i in range(2, n + 1) if A[i] == True ]

def genPrimes():
    n = 2
    notPrime = {}
    while True:
        if n in notPrime:
            primes = notPrime.pop(n)
            for p in primes:
                notPrime.setdefault(n + p, []).append(p)
        else:
            notPrime[n * n] = [n]
            yield n
        n += 1

# from https://en.wikipedia.org/wiki/Trial_division#Method
def trial_division(n):
    """Return a list of the prime factors for a natural number."""
    if n < 2:
        return []
    prime_factors = []
    for p in sieve(int(n ** 0.5)):
        if p * p > n: break
        while n % p == 0:
            prime_factors.append(p)
            n //= p
    if n > 1:
        prime_factors.append(n)
    return prime_factors

def trial_division_frequency(primes, n):
    """Return a list of the prime factors for a natural number."""
    if n < 2:
        return {}
    prime_factors = {}
    for p in primes:
        if p * p > n: break
        while n % p == 0:
            if prime_factors.get(p):
                prime_factors[p] += 1
            else:
                prime_factors[p] = 1
            n //= p
    if n > 1:
        prime_factors[n] = 1
    return prime_factors

def test_genPrimes():
    primes = genPrimes()
    assert next(primes) == 2
    assert next(primes) == 3
    assert next(primes) == 5

test_genPrimes()
