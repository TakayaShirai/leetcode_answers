# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        dummyHead = ListNode(0)

        dummyHead.next = head
        ptr = dummyHead

        while ptr.next and ptr.next.next:
            if ptr.next.val == ptr.next.next.val:
                copy = ptr.next

                while copy.next and copy.val == copy.next.val:
                    copy = copy.next
                
                ptr.next = copy.next
            
            else:
                ptr = ptr.next

        return dummyHead.next