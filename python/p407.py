# Idempotents
# Problem 407 
# If we calculate a^2 mod 6 for 0 ≤ a ≤ 5 we get: 0,1,4,3,4,1.

# The largest value of a such that a2 ≡ a mod 6 is 4.
# Let's call M(n) the largest value of a < n such that a^2 ≡ a (mod n).
# So M(6) = 4.

# Find ∑M(n) for 1 ≤ n ≤ 10^7.

def M(n: int) -> int:
    for a in range(0, n):
    # for a in range(n-1, 0, -1):
        print(f' {a}, {a*a%n}')
        # if a * a % n == a:
        #     return a

def solution() -> int:
    result = 0
    for n in range(2, 10 ** 7 + 1):
        if n % 1000 == 0:
            print(n)
        result += M(n)
    return result

def main() -> None:
    print(solution())
    
if __name__ == '__main__':
    main()
