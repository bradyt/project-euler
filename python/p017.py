# Number letter counts
# Problem 17 

# If the numbers 1 to 5 are written out in words: one, two, three,
# four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
# total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three
# hundred and forty-two) contains 23 letters and 115 (one hundred and
# fifteen) contains 20 letters. The use of "and" when writing out
# numbers is in compliance with British usage.

d = {
    1000 : 'onethousand',
    1    : 'one',
    2    : 'two',
    3    : 'three',
    4    : 'four',
    5    : 'five',
    6    : 'six',
    7    : 'seven',
    8    : 'eight',
    9    : 'nine',
    10   : 'ten',
    11   : 'eleven',
    12   : 'twelve',
    13   : 'thirteen',
    14   : 'fourteen',
    15   : 'fifteen',
    18   : 'eighteen',
    20   : 'twenty',
    30   : 'thirty',
    40   : 'forty',
    50   : 'fifty',
    80   : 'eighty',
}

def string(n: int) -> str:
    if n in d:
        return d[n]
    q, r = divmod(n, 100)
    if r == 0:
        return string(q) + 'hundred'
    elif n > 100:
        return string(100 * q) + 'and' + string(r)
    if n in range(14, 20):
        return string(n - 10) + 'teen'
    q, r = divmod(n, 10)
    if r == 0:
        return string(q) + 'ty'
    elif q in range(2, 10):
        return string(10 * q) + string(r)

def solution() -> int:
    return sum([ len(string(n)) for n in range(1, 1001) ])
