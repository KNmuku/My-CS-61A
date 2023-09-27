from tree import *
def height(t):
    """Return the height of a tree.

    >>> t = tree(3, [tree(5, [tree(1)]), tree(2)])
    >>> height(t)
    2
    """
    return max([-1] + [height(b) for b in branches(t)]) + 1
    
def max_path_sum(t):
    """
    >>> t = tree(1, [tree(5, [tree(1), tree(3)]), tree(10)])
    >>> max_path_sum(t)
    11
    """
    if is_leaf(t):
        return label(t)
    else:
        return max([max_path_sum(b) for b in branches(t)]) + label(t)
    
def square_tree(t):
    """
    >>> numbers = tree(1,
    ...                [tree(2, 
    ...                    [tree(3), 
    ...                     tree(4)]), 
    ...                 tree(5, 
    ...                      [tree(6, 
    ...                           [tree(7)]), 
    ...                       tree(8)])])
    >>> print_tree(square_tree(numbers))
    1
      4
        9
        16
      25
        36
          49
        64
    """
    return tree(label(t)**2, [square_tree(b) for b in branches(t)])

def find_path(tree, x):
    """
    >>> t = tree(2, [tree(7, [tree(3), tree(6, [tree(5), tree(11)])]), tree(15)])
    >>> find_path(t, 5)
    [2, 7, 6, 5]
    >>> find_path(t, 10) # returns None
    """ 
    if label(tree) == x:
        return [label(tree)]
    for b in branches(tree):
        path = find_path(b, x)
        if path:
            return [label(tree)] + path
                       
def prune_binary(t, nums):
    """
    >>> t = tree('1', [tree('0', [tree('0'), tree('1')]), tree('1', [tree('0')])])
    >>> prune_binary(t, ['01', '110', '100'])
    ['1', ['0', ['0']], ['1', ['0']]]
    """
    if is_leaf(t):
        if label(t) in nums:
            return t
        return None
    else:
        next_valid_nums = [num[1:] for num in nums if num[0] == label(t)]
        new_branches = []
        for b in branches(t):
            pruned_branch = prune_binary(b, next_valid_nums)
            if pruned_branch is not None:
                new_branches = new_branches + [pruned_branch]
        if not new_branches:
            return None
        return tree(label(t), new_branches)

# Alternative solution
    if is_leaf(t):
        if label(t) in nums:
            return t
        return None
    next_valid_nums = [num[1:] for num in nums if num[0] == label(t)]
    new_branches = [prune_binary(b, next_valid_nums) for b in branches(t) if prune_binary(b, next_valid_nums)]
    return tree(label(t), new_branches) if new_branches else None