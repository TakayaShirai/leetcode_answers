# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        dummy = ListNode(0, head)
        cur = head
        startLeft = dummy
        
        for i in range(left - 1):
            startLeft = cur
            cur = cur.next
        
        prev = None
        
        for i in range(right - left + 1):
            nextNode = cur.next
            cur.next = prev
            prev = cur
            cur = nextNode
        
        startLeft.next.next = cur
        startLeft.next = prev
        
        return dummy.next


        # currentPosition = 1
        # currentNode = head
        # startNode = head
        
        # while currentPosition < left:
        #     startNode = currentNode
        #     currentNode = currentNode.next
        #     currentPosition += 1
        
        # previousNode = None
        # tailNode = currentNode
        
        # while currentPosition <= right:
        #     nextNode = currentNode.next
        #     currentNode.next = previousNode
        #     previousNode = currentNode
        #     currentNode = nextNode
        #     currentPosition += 1
        
        # startNode.next = previousNode
        # tailNode.next = currentNode
        
        # if left > 1:
        #     return head
        
        # return previousNode
