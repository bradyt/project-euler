# Digit factorial chains
# Problem 74

# The number 145 is well known for the property that the sum of the
# factorial of its digits is equal to 145:

# 1! + 4! + 5! = 1 + 24 + 120 = 145

# Perhaps less well known is 169, in that it produces the longest
# chain of numbers that link back to 169; it turns out that there are
# only three such loops that exist:

# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872

# It is not difficult to prove that EVERY starting number will
# eventually get stuck in a loop. For example,

# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)

# Starting with 69 produces a chain of five non-repeating terms, but
# the longest non-repeating chain with a starting number below one
# million is sixty terms.

# How many chains, with a starting number below one million, contain
# exactly sixty non-repeating terms?

def memoize(f):
    memo = {}
    def helper(x):
        if x not in memo:
            memo[x] = f(x)
        return memo[x]
    return helper

@memoize
def factorial(n: int) -> int:
    return 1 if n == 0 else n * factorial(n - 1)

def next_term(n: int) -> int:
    return sum([factorial(int(c)) for c in str(n)])

endpoints = {
    169: 3,
    363601: 3,
    1454: 3,
    871: 2,
    45361: 2,
    872: 2,
    45361: 2,
}

@memoize
def chain_rec(current: int) -> int:
    if current in endpoints:
        return endpoints[current]
    else:
        next_one = next_term(current)
        if next_one == current:
            return 1
        else:
            return 1 + chain_rec(next_term(current))

def solution():
    count = 0
    for n in range(10 ** 6):
        if chain_rec(n) == 60:
            count += 1
    return count

def main():
    print(solution())

if __name__ == '__main__':
    main()
