# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countNodes(self, root: Optional[TreeNode]) -> int:
        height = self.getHeight(root)
        
        if height <= 1:
            return height
        
        return 2 ** (height - 1) - 1 + self.getNumOfLeafNodes(root, height)
        
        
    def getHeight(self, root: Optional[TreeNode]) -> int:
        height, cur = 0, root
        while cur:
            height += 1
            cur = cur.left
        return height
    
    
    def nodeExists(self, node: Optional[TreeNode], index: int, height: int) -> bool:
        count, left, right = 0, 0, 2 ** (height - 1) - 1
        
        while count < height - 1:
            mid = math.ceil((left + right) / 2)
            
            if index < mid:
                node = node.left
                right = mid - 1
            else:
                node = node.right
                left = mid
            
            count += 1
        
        return node != None
    
    
    def getNumOfLeafNodes(self, root: Optional[TreeNode], height: int) -> int:
        left, right = 0, 2 ** (height - 1) - 1
        
        while left < right:
            mid = math.ceil((left + right) / 2)
            if self.nodeExists(root, mid, height):
                left = mid
            else:
                right = mid - 1 
        return left + 1
    
    
    
        
            
        
        
        
