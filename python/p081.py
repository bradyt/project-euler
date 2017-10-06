# Path sum: two ways
# Problem 81

# In the 5 by 5 matrix below, the minimal path sum from the top left
# to the bottom right, by only moving to the right and down, is
# indicated in bold red and is equal to 2427.

# _131  673  234  103   18
# _201 _ 96 _342  965  150
#  630  803 _746 _422  111
#  537  699  497 _121  956
#  805  732  524 _ 37 _331

# Find the minimal path sum, in matrix.txt (right click and "Save
# Link/Target As..."), a 31K text file containing a 80 by 80 matrix,
# from the top left to the bottom right by only moving right and down.

from typing import List

def calculate_work(A: List[List[int]]) -> int:
    n = len(A)
    B = [ [0] * n for _ in range(n) ]

    def next(k):

        def work_it(i):
            j = k - i
            up   = B[i - 1][j] if i > 0 else float('inf')
            left = B[i][j - 1] if j > 0 else float('inf')
            B[i][j] = A[i][j] + min(up, left)

        if k == 0:
            B[0][0] = A[0][0]

        elif k <= n - 1:
            width = k + 1
            for i in range(width):
                work_it(i)

        else:
            width = 2 * n - (k + 1)
            for i in range(k + 1 - n, n):
                work_it(i)

    for i in range(2 * n - 1):
        next(i)

    return B[-1][-1]

def get_matrix_from_file() -> List[List[int]]:
    with open('../p081_matrix.txt', 'r') as f:
        lines = f.readlines()
    for i in range(len(lines)):
        cells = lines[i].split(',')
        n = len(cells)
        lines[i] = [ int(cells[j]) for j in range(n) ]
    return lines

def solution() -> int:
    return calculate_work(get_matrix_from_file())

def main() -> None:
    print(solution())

if __name__ == '__main__':
    main()

def test_calculate_work() -> None:

    matrix = [
        [ 131, 673, 234, 103,  18 ],
        [ 201,  96, 342, 965, 150 ],
        [ 630, 803, 746, 422, 111 ],
        [ 537, 699, 497, 121, 956 ],
        [ 805, 732, 524,  37, 331 ],
    ]

    assert(calculate_work(matrix) == 2427)
