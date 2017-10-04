
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

def test_genPrimes():
    primes = genPrimes()
    assert next(primes) == 2
    assert next(primes) == 3
    assert next(primes) == 5

test_genPrimes()
