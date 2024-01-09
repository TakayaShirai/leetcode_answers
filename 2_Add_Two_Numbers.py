# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        ans = ListNode(0)
        copy = ans
        carry = 0
        
        while l1 or l2:
            if l1 and l2:
                n = (l1.val + l2.val + carry) % 10
                carry = (l1.val + l2.val + carry) // 10
                l1 = l1.next
                l2 = l2.next
            elif l1:
                n = (l1.val + carry) % 10
                carry = (l1.val + carry) // 10
                l1 = l1.next            
            elif l2:
                n = (l2.val + carry) % 10
                carry = (l2.val + carry) // 10
                l2 = l2.next
            
            copy.val = n
            
            if l1 or l2:
                copy.next = ListNode(0)
                copy = copy.next
            
        if carry == 1:
            copy.next = ListNode(1)
        
        return ans
            
            
        
