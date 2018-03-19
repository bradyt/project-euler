
from datetime import datetime

ps = [
    'p001',
    'p002',
    'p003',
    'p004',
    'p005',
    'p006',
    'p007',
    'p008',
    'p009',
    'p010',
    'p011',
    'p012',
    'p013',
    # 'p014', # ~3 seconds
    'p015',
    # 'p016',
    # 'p017',
    # 'p018',
    # 'p019',
]

solutions = {
    'p001': 233168,
    'p002': 4613732,
    'p003': 6857,
    'p004': 906609,
    'p005': 232792560,
    'p006': 25164150,
    'p007': 104743,
    'p008': 23514624000,
    'p009': 31875000,
    'p010': 142913828922,
    'p011': 70600674,
    'p012': 76576500,
    'p013': 5537376230,
    'p014': 837799,
    'p015': 137846528820,
}

def main():
    for p in ps:
        print(p)
        pl = __import__(p)
        startTime= datetime.now() 
        solution = pl.solution()
        timeElapsed=datetime.now()-startTime 
        print(solution)
        # assert(solution == solutions[p])
        print('Time elapsed (hh:mm:ss.ms) {}'.format(timeElapsed))

if __name__ == '__main__':
    main()
