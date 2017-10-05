# Largest prime factor
# Problem 3

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

import primes

def get_prime_largest_factor(n):
    ps = primes.genPrimes()
    p = 1
    while p ** 2 < n:
        p = next(ps)
        while n % p == 0:
            n //= p
    return max(p, n)

def test_get_prime_largest_factor():
    assert get_prime_largest_factor(2) == 2
    assert get_prime_largest_factor(4) == 2
    assert get_prime_largest_factor(3) == 3
    assert get_prime_largest_factor(9) == 3
    assert get_prime_largest_factor(6) == 3
    assert get_prime_largest_factor(13195) == 29

test_get_prime_largest_factor()

def solution():
    return get_prime_largest_factor(600851475143)

def main():
    print(solution())

if __name__ == "__main__":
    main()
