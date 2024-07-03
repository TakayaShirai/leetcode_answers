class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        hashset = set()

        for num in nums:
            if num in hashset:
                return True
            else:
                hashset.add(num)
        
        return False
        
#         nums.sort()
        
#         for i in range(len(nums) - 1):
#             if nums[i] == nums[i+1]:
#                 return True
        
#         return False
        
