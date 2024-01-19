class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        prefixSumMap = {0: 1}
        total, count = 0, 0
        
        for num in nums:
            total += num
            
            if total - k in prefixSumMap:
                count += prefixSumMap[total - k]
            
            if total in prefixSumMap:
                prefixSumMap[total] += 1
            else:
                prefixSumMap[total] = 1
        
        return count
            
        
        
            
