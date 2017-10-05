# Lattice paths
# Problem 15

# Starting in the top left corner of a 2×2 grid, and only being able
# to move to the right and down, there are exactly 6 routes to the
# bottom right corner.

# How many such routes are there through a 20×20 grid?

# Solution:
# We have 40 choices of turn left or right, with equal number both
# ways, so "40 choose 20".

def factorial(n: int) -> int:
    return 1 if n == 1 else n * factorial(n - 1)

def solution() -> int:
    return factorial(40) // (factorial(20) ** 2)

def main():
    print(solution())

if __name__ == "__main__":
    main()
