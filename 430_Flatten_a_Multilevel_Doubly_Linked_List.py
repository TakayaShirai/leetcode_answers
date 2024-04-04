"""
# Definition for a Node.
class Node:
    def __init__(self, val, prev, next, child):
        self.val = val
        self.prev = prev
        self.next = next
        self.child = child
"""

class Solution:
    def flatten(self, head: 'Optional[Node]') -> 'Optional[Node]':
        cur = head
        stack = deque()
        
        while cur:
            if cur.child:
                self.subFlatten(cur, stack)
            cur = cur.next
        
        return head
        
    
    def subFlatten(self, cur: 'Optional[Node]', stack: List['Optional[Node]']):
        if cur.next:
            stack.append(cur.next)
        cur.next = cur.child
        cur.child.prev = cur
        cur.child = None
        
        while cur.next:
            cur = cur.next
            if cur.child:
                self.subFlatten(cur, stack)
        
        if stack:
            cur.next = stack.pop()
            cur.next.prev = cur
            cur = cur.next
        
