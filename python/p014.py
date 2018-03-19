# Longest Collatz sequence
# Problem 14

# The following iterative sequence is defined for the set of positive
# integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the
# following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at
# 1) contains 10 terms. Although it has not been proved yet (Collatz
# Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest
# chain?

# NOTE: Once the chain starts the terms are allowed to go above one
# million.

from typing import Dict
from math import log

def next_value(n: int) -> int:
    return n // 2 if n % 2 == 0 else 3 * n + 1

def find_lengths() -> Dict[int, int]:
    lengths = { 2 ** i: i + 1 for i in range(int(log(10 ** 6, 2))) }
    def find_length_rec(n: int) -> int:
        if n in lengths:
            return lengths[n]
        else:
            length = find_length_rec(next_value(n)) + 1
            lengths[n] = length
            return length
    for n in range(3, 10 ** 6, 2):
        if n not in lengths:
            lengths[n] = find_length_rec(next_value(n)) + 1
    return lengths

def solution() -> int:
    lengths = find_lengths()
    k_max, v_max = 1, 1
    for k, v in lengths.items():
        if v > v_max and k < 10 ** 6:
            k_max, v_max = k, v
    return k_max

def main() -> None:
    print(solution())

if __name__ == "__main__":
    main()
