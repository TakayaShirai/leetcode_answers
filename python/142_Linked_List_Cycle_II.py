# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def detectCycle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        slow = head 
        fast = head

        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

            if slow == fast:
                slow = head
                
                while slow != fast:
                    slow = slow.next
                    fast = fast.next
                     
                return slow

        return None


        ## Space Complexity: O(n), Time complexity: O(n)
        # mp = {}

        # index = -1
        # cur = head

        # while cur:
        #     index += 1
        #     if cur not in mp:
        #         mp[cur] = index
        #         cur = cur.next
        #     else:
        #         return cur
        
        # return None
        