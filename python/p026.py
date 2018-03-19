
import math
import fractions
import itertools

def test(d, k, n):
    if n == 0:
        m = 1
    else:
        m = 10 ** n - 1
    result = fractions.Fraction(10 ** k * m, d)
    return result.denominator == 1

def main():
    best_d, best_n = -math.inf, -math.inf
    for d in range(1000, 0, -1):
        n = test_d(d)
        if n > best_n:
            best_d, best_n = d, n
        if d < best_n:
            break
    return best_d

def test_d(d):
    for k in itertools.count():
        for n in range(0, d):
            if test(d, k, n):
                return n
                
            
