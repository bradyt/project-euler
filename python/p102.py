# Triangle containment
# Problem 102 

# Three distinct points are plotted at random on a Cartesian plane,
# for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

# Consider the following two triangles:

# A(-340,495), B(-153,-910), C(835,-947)

# X(-175,41), Y(-421,-714), Z(574,-645)

# It can be verified that triangle ABC contains the origin, whereas
# triangle XYZ does not.

# Using triangles.txt (right click and 'Save Link/Target As...'), a
# 27K text file containing the co-ordinates of one thousand "random"
# triangles, find the number of triangles for which the interior
# contains the origin.

# NOTE: The first two examples in the file represent the triangles in
# the example given above.

# Solution:
# If f(x) denotes the line between the first two points,
# We'll check that (y - f(x)) * (0 - f(0)) > 0.
# If we multiply both sides by (Δx)^2, we can use the following equation,
# to avoid dividing by zero.
# f(x) * Δx = y0 * Δx + (x - x0) * Δy


from typing import Tuple

def is_origin_on_same_side(p0: Tuple[int, int],
                           p1: Tuple[int, int],
                           p: Tuple[int, int]) -> bool:
    x0, y0 = p0
    x1, y1 = p1
    x, y = p
    Δx = x1 - x0
    Δy = y1 - y0
    return (y * Δx - ((x - x0) * Δy + y0 * Δx)) \
        * (0 * Δx - ((0 - x0) * Δy + y0 * Δx)) > 0

def get_points():
    import csv
    with open('../p102_triangles.txt') as f:
        reader = csv.reader(f)
        result = []
        for row in reader:
            triple = []
            for i in range(3):
                triple.append((int(row[2 * i]),
                               int(row[2 * i + 1])))
            result.append(triple)
    return result

def solution() -> int:
    points = get_points()
    count = 0
    for triple in points:
        p1, p2, p3 = triple
        if all([is_origin_on_same_side(p1, p2, p3),
                is_origin_on_same_side(p1, p3, p2),
                is_origin_on_same_side(p2, p3, p1)]):
            count += 1
    return count

def main() -> None:
    print(solution())

if __name__ == '__main__':
    main()

