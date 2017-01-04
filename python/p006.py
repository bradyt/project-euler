# Sum square difference
# Problem 6
#
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one
# hundred natural numbers and the square of the sum.

def sum_to_n(n):
    return n * (n + 1) // 2

def sum_sqrs_to_n(n):
    return n * (n + 1) * (2 * n + 1) // 6

def p006():
    return sum_to_n(100) ** 2 - sum_sqrs_to_n(100)

def main():
    print(p006())

if __name__ == '__main__':
    main()
