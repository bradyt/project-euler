# Largest palindrome product
# Problem 4

# A palindromic number reads the same both ways. The largest
# palindrome made from the product of two 2-digit numbers is 9009 =
# 91 × 99.

# Find the largest palindrome made from the product of two 3-digit
# numbers.

import digits

def is_palindromic(n):
    digs = digits.digits(n)
    l = len(digs)
    return all([ digs[i] == digs[l - 1 - i]
                 for i in range(l // 2) ])

def p004():
    result = 10201
    for i in range(999, 100, -1):
        for j in range(999, i, -1):
            prod = i * j
            if prod < result:
                break
            if is_palindromic(prod):
                result = prod
    return result

def solution():
    return p004()

def main():
    print(solution())

if __name__ == '__main__':
    main()
