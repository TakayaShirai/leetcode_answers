# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        if not root:
            return True
        return self.DFS(root, -math.inf, math.inf)
    
    def DFS(self, root: Optional[TreeNode], minVal: int, maxVal: int) -> bool:
        if root.val <= minVal or root.val >= maxVal:
            return False
        if root.left:
            if not self.DFS(root.left, minVal, root.val):
                return False
        if root.right:
            if not self.DFS(root.right, root.val, maxVal):
                return False
        
        return True
            
        
        
