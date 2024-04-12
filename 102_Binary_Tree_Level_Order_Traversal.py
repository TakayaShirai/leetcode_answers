# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []
        
        queue = deque()
        queue.append(root)
        res = []
        
        while queue:
            length = len(queue)
            count = 0
            tempList = []
            
            while count < length:
                cur = queue.popleft()
                tempList.append(cur.val)
                if cur.left:
                    queue.append(cur.left)
                if cur.right:
                    queue.append(cur.right)
                count += 1
            
            res.append(tempList)
        
        return res
        
        
        
## Two queues approach
#         if not root:
#             return []

#         res = []
        
#         queue1 = deque()
#         queue2 = deque()
        
#         queue1.append(root)
        
#         while queue1 or queue2:
#             tempList = []
            
#             while queue1:
#                 cur = queue1.popleft()
#                 if cur.left:
#                     queue2.append(cur.left)
#                 if cur.right:
#                     queue2.append(cur.right)
#                 tempList.append(cur.val)
            
#             if tempList:
#                 res.append(tempList)
            
#             tempList = []
            
#             while queue2:
#                 cur = queue2.popleft()
#                 if cur.left:
#                     queue1.append(cur.left)
#                 if cur.right:
#                     queue1.append(cur.right)
#                 tempList.append(cur.val)
            
#             if tempList:
#                 res.append(tempList)
        
#         return res
            
            
                
        
        
        
