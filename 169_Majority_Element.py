class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        ## Boyer-Moore Voting Algorithm approach (time: O(n), space: O(1))
        count = 0
        majority = None
        
        for num in nums:
            if count == 0:
                majority = num
            if num == majority:
                count += 1
            else:
                count -= 1
        
        return majority
            
        
      
## sorting apprach (time: O(nlogn), space: O(1))
#         nums.sort()
#         return nums[len(nums) // 2]
        
        
## hashmap approach (time: O(n), space: O(n))          
#         if len(nums) == 1:
#             return nums[0]
        
#         hashmap = {}
        
#         for num in nums:
#             if num not in hashmap:
#                 hashmap[num] = 1
#             else:
#                 hashmap[num] += 1
#                 if hashmap[num] > len(nums) / 2:
#                     return num
        
#         return 0
                
