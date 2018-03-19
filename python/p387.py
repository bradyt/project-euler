# Harshad Numbers
# Problem 387

# A Harshad or Niven number is a number that is divisible by the sum
# of its digits. 201 is a Harshad number because it is divisible by 3
# (the sum of its digits.) When we truncate the last digit from 201,
# we get 20, which is a Harshad number. When we truncate the last
# digit from 20, we get 2, which is also a Harshad number. Let's call
# a Harshad number that, while recursively truncating the last digit,
# always results in a Harshad number a right truncatable Harshad
# number.

# Also:
# 201/3=67 which is prime. Let's call a Harshad number that, when
# divided by the sum of its digits, results in a prime a strong
# Harshad number.

# Now take the number 2011 which is prime. When we truncate the last
# digit from it we get 201, a strong Harshad number that is also right
# truncatable. Let's call such primes strong, right truncatable
# Harshad primes.

# You are given that the sum of the strong, right truncatable Harshad
# primes less than 10000 is 90619.

# Find the sum of the strong, right truncatable Harshad primes less
# than 10^14.

import sympy

def right_truncate(n: int) -> int:
    return int(str(n)[:-1])

def is_harshad(n: int) -> bool:
    """
    A Harshad or Niven number is a number that is divisible by the sum
    of its digits.
    """
    return n % sum([int(c) for c in str(n)]) == 0

def is_right_truncatable_harshad(n: int) -> bool:
    """
    Let's call a Harshad number that, while recursively truncating the
    last digit, always results in a Harshad number a right truncatable
    Harshad number.
    """
    l = len(str(n))
    for i in range(l - 1):
        n = right_truncate(n)
        if not is_harshad(n):
            return False
    return True

def is_strong_harshad(n: int) -> bool:
    """
    Let's call a Harshad number that, when divided by the sum of its
    digits, results in a prime a strong Harshad number.
    """
    if not is_harshad(n):
        return False
    s = sum([int(c) for c in str(n)])
    return sympy.isprime(n // s)

def is_strong_right_truncatable_harshad_prime(n: int) -> bool:
    """
    Now take the number 2011 which is prime. When we truncate the last
    digit from it we get 201, a strong Harshad number that is also
    right truncatable. Let's call such primes strong, right
    truncatable Harshad primes.
    """
    is_prime = sympy.isprime(n)

    s = sum([ int(c) for c in str(n) ])
    return sympy.isprime(n // s)
