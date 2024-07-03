class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        
        partition = 0
                
        for checkIndex in range(len(nums)):
            if nums[checkIndex] != 0:
                nums[partition], nums[checkIndex] = nums[checkIndex], nums[partition]
                partition += 1
            
        return nums
        
        