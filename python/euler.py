
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
    # 'p011',
    # 'p012',
    # 'p013',
    # 'p014',
    # 'p015',
    # 'p016',
    # 'p017',
    # 'p018',
    # 'p019',
]

def main():
    for p in ps:
        print(p)
        p = __import__(p)
        startTime= datetime.now() 
        p.main()
        timeElapsed=datetime.now()-startTime 
        print('Time elpased (hh:mm:ss.ms) {}'.format(timeElapsed))

if __name__ == '__main__':
    main()
