def stairs(n):
    if n == 0:
        return 1
    elif n < 0:
        return 0
    else: return stairs(n-1) + stairs(n-2)

def count_k(n, k):
    """
    >>> count_k(3, 3) # 3, 2 + 1, 1 + 2, 1 + 1 + 1
    4
    >>> count_k(4, 4)
    8
    >>> count_k(10, 3)
    274
    >>> count_k(300, 1) # Only one step at a time
    1
    """
    if n == 0:
        return 1
    elif n < 0:
        return 0
    else:
        sum = 0
        for i in range(1, k+1):
            sum += count_k(n-i, k)
        return sum
    

def even_weighted(s):
    return [k * s[k] for k in range(len(s)) if k % 2 == 0]

def max_product(s):
    """Return the maximum product that can be formed using non-consecutive
    elements of s.

    >>> max_product([10,3,1,9,2]) # 10 * 9
    90
    >>> max_product([5,10,5,10,5]) # 5 * 5 * 5
    125
    >>> max_product([]) 
    1
    """
    if not s:
        return 1
    elif len(s) <= 2:
        return max(s)
    else:  
        return max(s[0] * max_product(s[2:]), max_product(s[1:]))