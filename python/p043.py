# Sub-string divisibility
# Problem 43
#
# The number, 1406357289, is a 0 to 9 pandigital number because it is
# made up of each of the digits 0 to 9 in some order, but it also has
# a rather interesting sub-string divisibility property.
#
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this
# way, we note the following:
#
#     d_2d_3d_4=406 is divisible by 2
#     d_3d_4d_5=063 is divisible by 3
#     d_4d_5d_6=635 is divisible by 5
#     d_5d_6d_7=357 is divisible by 7
#     d_6d_7d_8=572 is divisible by 11
#     d_7d_8d_9=728 is divisible by 13
#     d_8d_9d_10=289 is divisible by 17
#
# Find the sum of all 0 to 9 pandigital numbers with this property.

import functools

primes = [17, 13, 11, 7, 5, 3, 2]

def bt(c):
    if len(c) == 10:
        if c[0] == 0:
            return 0
        else:
            return undigits(c)
    elif len(c) >= 3 and not has_property(c):
        return 0
    else:
        return sum(bt([i] + c) for i in range(10) if i not in c)

def has_property(c):
    p = primes[len(c) - 3]
    return undigits(c[:3]) % p == 0

def undigits(digits):
    return functools.reduce(lambda z, x: 10 * z + x, digits, 0)

assert undigits([]) == 0
assert undigits([0]) == 0
assert undigits([1]) == 1
assert undigits([1, 2, 3]) == 123

def main():
    result = bt([])
    assert result == 16695334890
    print(result)

if __name__ == '__main__':
    main()
