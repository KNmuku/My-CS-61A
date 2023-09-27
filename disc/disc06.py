def memory(n):
    """
    >>> f = memory(10)
    >>> f(lambda x: x * 2)
    20
    >>> f(lambda x: x - 7)
    13
    >>> f(lambda x: x > 5)
    True
    """
    def f(g):
        nonlocal n
        n = g(n)
        return n
    return f

def group_by(s, fn):
    """
    >>> group_by([12, 23, 14, 45], lambda p: p // 10)
    {1: [12, 14], 2: [23], 4: [45]}
    >>> group_by(range(-3, 4), lambda x: x * x)
    {9: [-3, 3], 4: [-2, 2], 1: [-1, 1], 0: [0]}
    """
    grouped = {}
    for e in s:
        key = fn(e)
        if key in grouped:
            grouped[key].append(e)
        else:
            grouped[key] = [e]
    return grouped

def add_this_many(x, el, s):
    """
    >>> s = [1, 2, 4, 2, 1]
    >>> add_this_many(1, 5, s)
    >>> s
    [1, 2, 4, 2, 1, 5, 5]
    >>> add_this_many(2, 2, s)
    >>> s
    [1, 2, 4, 2, 1, 5, 5, 2, 2]
    """
    times = sum([e == x for e in s])
    for n in range(times):
        s.append(el)

def filter(iterable, fn):
    """
    >>> is_even = lambda x: x % 2 == 0
    >>> list(filter(range(5), is_even))
    [0, 2, 4]
    >>> all_odd = (2*y-1 for y in range(5))
    >>> list(filter(all_odd, is_even))
    []
    >>> naturals = (n for n in range(1, 100))
    >>> s = filter(naturals, is_even)
    >>> next(s)
    2
    >>> next(s)
    4
    """
    for i in iterable:
        if fn(i):
            yield i

def merge(a, b):
    """
    >>> def sequence(start, step):
    ...     while True:
    ...         yield start
    ...         start += step
    >>> a = sequence(2, 3)
    >>> b = sequence(3, 2)
    >>> result = merge(a, b)
    >>> [next(result) for _ in range(20)]
    [2, 3, 5, 7, 8, 9, 11, 13, 14, 15, 17, 19, 20, 21, 23, 25, 26, 27, 29, 31]
    """
    tmp_a, tmp_b = next(a), next(b)
    while True:
        if tmp_a == tmp_b:
            yield tmp_a
            tmp_a, tmp_b = next(a), next(b)
        elif tmp_a < tmp_b:
            yield tmp_a
            tmp_a = next(a)
        else:
            yield tmp_b
            tmp_b = next(b)