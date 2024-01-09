# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if head == None:
            return head
        
        stack = deque()
        cur = head
        
        while cur:
            stack.appendleft(cur.val)
            cur = cur.next
        
        ans = ListNode(stack.popleft())
        copy = ans
        
        while stack:
            copy.next = ListNode(stack.popleft())
            copy = copy.next
            
        return ans
            
