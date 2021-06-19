
def main():
    try:
        if sys.argv[2] == null:
            print 'Needs city'
    except SyntaxError:
        sys.exit()
    Hello(sys.argv[1], sys.argv[2])

def Hello(name, city):
    # name = name + '!!!!'
    print 'Hello', name, 'from', city

import sys

if __name__ == '__main__':
    main()


