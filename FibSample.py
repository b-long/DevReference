fibDatabase = {}

def fib(n):
    if (n == 0) or (n == 1):
        return 1
    else:
        try:
            return fibDatabase[n]
        except:
            fibDatabase[n] = fib(n-1) + fib(n-2)
            return fibDatabase[n]

def normalFib(n):
    if (n == 0) or (n == 1):
        return 1
    else:
        return fib(n-1) + fib(n-2)

class FibClass:
    def __init__(self):
        self.x = 10
        self.y = 20
    def __repr__(self):
        return str(self.x + self.y)
    def addToX(self, val):
        self.x += val


x = FibClass()

x.addTo(10)
FibClass.addToX(x, 10)

