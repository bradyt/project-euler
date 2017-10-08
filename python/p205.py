# Dice Game
# Problem 205 
# Peter has nine four-sided (pyramidal) dice, each with faces numbered
# 1, 2, 3, 4.
# Colin has six six-sided (cubic) dice, each with faces numbered 1, 2,
# 3, 4, 5, 6.

# Peter and Colin roll their dice and compare totals: the highest
# total wins. The result is a draw if the totals are equal.

# What is the probability that Pyramidal Pete beats Cubic Colin? Give
# your answer rounded to seven decimal places in the form 0.abcdefg

def count_rolls_4_9(t):
    m = 4
    count = 0
    for a in range(1, min(m + 1, t)):
        for b in range(1, min(m + 1, t - a)):
            for c in range(1, min(m + 1, t - a - b)):
                for d in range(1, min(m + 1, t - a - b - c)):
                    for e in range(1, min(m + 1, t - a - b - c - d)):
                        for f in range(1, min(m + 1, t - a - b - c - d - e)):
                            for g in range(1, min(m + 1, t - a - b - c - d - e - f)):
                                for h in range(1, min(m + 1, t - a - b - c - d - e - f - g)):
                                    i = t - a - b - c - d - e - f - g - h
                                    if i < m + 1:
                                        count += 1
    return count

def count_rolls_6_6(t):
    m = 6
    count = 0
    for a in range(1, min(m + 1, t)):
        for b in range(1, min(m + 1, t - a)):
            for c in range(1, min(m + 1, t - a - b)):
                for d in range(1, min(m + 1, t - a - b - c)):
                    for e in range(1, min(m + 1, t - a - b - c - d)):
                        f = t - a - b - c - d - e
                        if f < m + 1:
                            count += 1
    return count

def count_peter_wins() -> int:
    p_wins = 0
    c_less_than_k = 0
    for k in range(4 * 9 + 1):
        p_rolls_k = count_rolls_4_9(k)
        p_wins_k = p_rolls_k * c_less_than_k
        p_wins += p_wins_k
        c_less_than_k += count_rolls_6_6(k)
    return p_wins

def solution() -> str:
    result = count_peter_wins() / (4 ** 9 * 6 ** 6)
    return f'{result:.7f}'

def main() -> None:
    print(solution())

if __name__ == '__main__':
    main()
