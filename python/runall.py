
import os
import glob

euler_problems = glob.glob('./p*.py')

def main():
    for ep in euler_problems:
        os.system('python3 ' + ep)

if __name__ == '__main__':
    main()
