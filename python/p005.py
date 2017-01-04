# Smallest multiple
# Problem 5
#
# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by
# all of the numbers from 1 to 20?

import fractions

def lcm(a, b):
    return a * b // fractions.gcd(a, b)

def lcm_list(l):
    result = 1
    for a in l:
        result = lcm(a, result)
    return result

def p005():
    return lcm_list(range(1, 20))

def main():
    print(p005())

if __name__ == '__main__':
    main()
