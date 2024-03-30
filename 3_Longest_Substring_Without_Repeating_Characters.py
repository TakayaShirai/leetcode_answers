class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
######. Sliding Window
######  T: O(N)
######  S: O(N)

        if len(s) < 2:
            return len(s)
        
        maxCount = 0
        left = 0
        hashT = {}
        
        for right in range(len(s)):
            if s[right] in hashT and left <= hashT[s[right]]:
                left = hashT[s[right]] + 1
                
            hashT[s[right]] = right
            maxCount = max(maxCount, right - left + 1)
 
        return maxCount
        
######. Brute Force 
######  T: O(N^2)
######. S: O(N)
#         maxCount = 0
        
#         for i in range(len(s)):
#             hashT = {}
#             count = 0
            
#             for j in range(i, len(s)):
#                 if (s[j] in hashT):
#                     break
#                 else:
#                     hashT[s[j]] = 1
#                     count += 1
            
#             maxCount = max(maxCount, count)
              
#         return maxCount
        
