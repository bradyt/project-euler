
# def integer_log_10(n):
#     p = 0
#     while True:
#         if 10 ** (p + 1) > n:
#             return p
#         else:
#             p += 1

def digits(n):
    l = []
    while n:
        n, d = divmod(n, 10)
        l.append(d)
    l.reverse()
    return l

def undigits(l):
    result = 0
    pos = 0
    while l:
        result += l.pop() * 10 ** pos
        pos += 1
    return result

def test_digits():
    assert digits(2) == [2]
    assert digits(23) == [2, 3]
    assert digits(235) == [2, 3, 5]

test_digits()
