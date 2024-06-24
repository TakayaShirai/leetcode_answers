# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
## DFS Approach
## T: O(N)
## S: O(N) (O(H): H is the height of the tree)
        res = []
        self.DFS(root, 1, res)
        return res
        
            
    def DFS(self, node: Optional[TreeNode], level: int, res: List[int]):
        if not node:
            return
        
        if len(res) < level:
            res.append(node.val)
        
        if node.right:
            self.DFS(node.right, level+1, res)
        
        if node.left:
            self.DFS(node.left, level+1, res)
        
        
        
## BFS Approach
## T: O(N)
## S: O(N) (O(W): W is the fattest part of the tree)
#         if not root:
#             return []
        
#         res = []
#         queue = deque()
#         queue.append(root)
        
#         while queue:
#             count = 0
#             length = len(queue)
            
#             while count < length:
#                 cur = queue.popleft()
#                 if cur.left:
#                     queue.append(cur.left)
#                 if cur.right:
#                     queue.append(cur.right)
#                 count += 1
            
#             res.append(cur.val)
        
#         return res
        
