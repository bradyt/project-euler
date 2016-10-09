# Multiples of 3 and 5 Problem 1

# If we list all the natural numbers below 10 that are multiples of 3
# or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_to_n(n):
    return n * (n + 1) // 2

def sum_multiples_to_n(n, m):
    return m * sum_to_n(n // m)

def sum_multiples_of_3_and_5():
    return sum_multiples_to_n(999, 3) + sum_multiples_to_n(999, 5) \
        - sum_multiples_to_n(999, 15)

