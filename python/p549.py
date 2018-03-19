# Divisibility of factorials
# Problem 549
# The smallest number m such that 10 divides m! is m=5.
# The smallest number m such that 25 divides m! is m=10.

# Let s(n) be the smallest number m such that n divides m!.
# So s(10)=5 and s(25)=10.
# Let S(n) be Σs(i) for 2 ≤ i ≤ n.
# S(100)=2012.

# Find S(10^8).

# 1! ==> 1
# 2! ==> 1, 2
# 3! ==> 1, 2, 3, 6
# 4! ==> 1, 2, 3, 4, 6, 8, 12, 16, ...
# 5! ==> 5, 10

from itertools import count
from primes import sieve, trial_division_with_cache
from typing import List

def s(ps: List[int], i: int) -> int:
    i_factors = trial_division_with_cache(ps, i)
    for m in count():
        m_factors = trial_division_with_cache(ps, m)
        for f in m_factors:
            if f in i_factors:
                i_factors.remove(f)
        if i_factors == []:
            return m

def S(n: int) -> int:
    ps = sieve(int(n ** 0.5))
    return sum([s(ps, i) for i in range(2, n + 1)])

def solution() -> int:
    return S(10 ** 3)

def main() -> None:
    print(solution())

if __name__ == '__main__':
    main()

# s(10) ==> 5
# 10 ==> 2, 5
#  5 ==> 5, 4, 3, 2, 1

# 1, 2(1), 3, 4, 5(1)

# s(25) ==> 10
# 25 ==> 5, 5
#  5 ==> 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

# 1, 2, 3, 4, 5(1), 6, 7, 8, 9, 10(2)
