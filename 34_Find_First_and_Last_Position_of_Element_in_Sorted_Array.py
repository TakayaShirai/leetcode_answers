class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        targetIdx = self.binarySearch(nums, 0, len(nums) - 1, target)
        
        if targetIdx == -1:
            return [-1, -1]
        
        tempRight, tempLeft = targetIdx, targetIdx

        while tempRight != -1:
            startIdx = tempRight
            tempRight = self.binarySearch(nums, 0, tempRight - 1, target)                                
           
        while tempLeft != -1:
            endIdx = tempLeft
            tempLeft = self.binarySearch(nums, tempLeft + 1, len(nums) - 1, target)
            
        return [startIdx, endIdx]
    
        
    def binarySearch(self, nums: List[int], left, right, target) -> int:        
        while left <= right:
            mid = (left + right) // 2
            if nums[mid] == target:
                return mid
            elif nums[mid] < target:
                left = mid + 1
            else:
                right = mid - 1
        
        return -1
                
