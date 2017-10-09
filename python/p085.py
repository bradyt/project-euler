# Counting rectangles
# Problem 85

# By counting carefully it can be seen that a rectangular grid
# measuring 3 by 2 contains eighteen rectangles:

#   ┏━━┱──┬──┐ ┏━━━━━┱──┐ ┏━━━━━━━━┓
#   ┃  ┃  │  │ ┃     ┃  │ ┃        ┃
#   ┡━━╃──┼──┤ ┡━━┯━━╃──┤ ┡━━┯━━┯━━┩
#   │  │  │  │ │  │  │  │ │  │  │  │
#   └──┴──┴──┘ └──┴──┴──┘ └──┴──┴──┘
#       6          4          2
#   ┏━━┱──┬──┐ ┏━━━━━┱──┐ ┏━━━━━━━━┓
#   ┃  ┃  │  │ ┃     ┃  │ ┃        ┃
#   ┃  ┠──┼──┤ ┃     ┠──┤ ┃        ┃
#   ┃  ┃  │  │ ┃     ┃  │ ┃        ┃
#   ┗━━┹──┴──┘ ┗━━━━━┹──┘ ┗━━━━━━━━┛
#       3          2          1

# Although there exists no rectangular grid that contains exactly two
# million rectangles, find the area of the grid with the nearest
# solution.

# Solution:
# note:
#   Σ_p Σ_q f(p) * g(q) = (Σ_p f(p)) * (Σ_q g(q))
# and
#   Σ_1^n i  = n * (n + 1) / 2
# then the count of subrectangles for an m x n rectangle is
#   Σ_{p=1}^m Σ_{q=1}^n (m - p + 1) * (n - q + 1)
#   = m * (m + 1) * n * (n + 1) / 4

from typing import Tuple
from itertools import count

def count_rectangles(m: int, n: int) -> int:
    return m * (m + 1) * n * (n + 1) // 4

def distance(point: Tuple[int, int]) -> int:
    m, n = point
    return abs(count_rectangles(m, n) - 2 * 10 ** 6)

def find_limit(m: int) -> int:
    for k in count():
        n_k = 2 ** k
        if count_rectangles(m, n_k) > 2 * 10 ** 6:
            return n_k

def solution() -> int:
    m, n = min([(m, n)
                for m in range(1, find_limit(1) + 1)
                for n in range(find_limit(m) + 1)],
               key=distance)
    return m * n

def main() -> None:
    print(solution())

if __name__ == '__main__':
    main()
