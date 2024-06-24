class Solution:
    def trap(self, height: List[int]) -> int:
        left = 0
        right = len(height) - 1
        maxLeft = 0
        maxRight = 0
        total = 0
        
        while left < right:
            if height[left] <= height[right]:
                total += self.subTrap(maxLeft, height[left])
                maxLeft = max(maxLeft, height[left])
                left += 1
            else:
                total += self.subTrap(maxRight, height[right])
                maxRight = max(maxRight, height[right])
                right -= 1         
        
        return total
    
    def subTrap(self, maxHeight, currentHeight):
        area = maxHeight - currentHeight
        if area > 0:
            return area
        return 0
            
        
