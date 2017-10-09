# Counting rectangles
# Problem 85

# By counting carefully it can be seen that a rectangular grid
# measuring 3 by 2 contains eighteen rectangles:


            ┏━━┱──┬──┐ ┏━━━━━┱──┐ ┏━━━━━━━━┓
            ┃  ┃  │  │ ┃     ┃  │ ┃        ┃
            ┡━━╃──┼──┤ ┡━━┯━━╃──┤ ┡━━┯━━┯━━┩
            │  │  │  │ │  │  │  │ │  │  │  │
            └──┴──┴──┘ └──┴──┴──┘ └──┴──┴──┘
                6          4          2
            ┏━━┱──┬──┐ ┏━━━━━┱──┐ ┏━━━━━━━━┓
            ┃  ┃  │  │ ┃     ┃  │ ┃        ┃
            ┃  ┠──┼──┤ ┃     ┠──┤ ┃        ┃
            ┃  ┃  │  │ ┃     ┃  │ ┃        ┃
            ┗━━┹──┴──┘ ┗━━━━━┹──┘ ┗━━━━━━━━┛
                3          2          1


# Although there exists no rectangular grid that contains exactly two
# million rectangles, find the area of the grid with the nearest
# solution.
