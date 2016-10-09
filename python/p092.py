
# Find starting numbers below 10 million that arrive at 89. 

import pdb

def square(n): return n**2

def digits(n):
    return [n] if n<10 else digits(n // 10)+[n % 10]

def prop(n):
    return sum(map(square,digits(n)))

def chain(n):
    n1 = prop(n)
    if n1 in [0, 1, 89]:
        return n1
    else:
        return chain(n1)

dict = {}
