class Solution:
    def maxArea(self, height: List[int]) -> int:
        maxVolume = 0
        left = 0
        right = len(height) - 1

        while left < right:
            x = right - left
            h = min(height[left], height[right])
            maxVolume = max(maxVolume, x*h)

            if height[left] > height[right]:
                right -= 1
            else:
                left += 1
        
        return maxVolume
