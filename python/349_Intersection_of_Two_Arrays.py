class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        mp = {}
        ans = []
        
        for num in nums1:
            if num not in mp:
                mp[num] = 0
        
        for num in nums2:
            if num in mp and mp[num] == 0:
                mp[num] = 1
                ans.append(num)
        
        return ans
        
