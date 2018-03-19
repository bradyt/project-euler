# Under The Rainbow
# Problem 493
# 70 colored balls are placed in an urn, 10 for each of the seven
# rainbow colors.

# What is the expected number of distinct colors in 20 randomly picked
# balls?

# Give your answer with nine digits after the decimal point
# (a.bcdefghij).

def solution() -> float:
    result = 4 / 3
    return float(f'{result:.9f}')

def main() -> None:
    print(solution())

if __name__ == '__main__':
    main()
