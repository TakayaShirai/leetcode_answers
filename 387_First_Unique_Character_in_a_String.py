class Solution:
    def firstUniqChar(self, s: str) -> int:
        mp = {}
        
        for char in s:
            if char not in mp:
                mp[char] = 0
            else:
                mp[char] += 1
        
        for i in range(len(s)):
            if mp[s[i]] == 0:
                return i
        
        return -1
        
