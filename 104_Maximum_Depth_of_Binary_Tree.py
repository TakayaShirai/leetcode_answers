# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        return self.countDepth(root, 0)
    
    def countDepth(self, node: Optional[TreeNode], count: int) -> int:
        if node == None:
            return count
        else:
            count += 1
            return max(self.countDepth(node.left, count), self.countDepth(node.right, count))
        
