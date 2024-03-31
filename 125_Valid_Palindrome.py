class Solution:
    def isPalindrome(self, s: str) -> bool:
        if len(s) < 2:
            return True
        
        s = s.lower()
        left = 0
        right = len(s) - 1
        
        while left < right:
            while not s[left].isalnum():
                left += 1
                if left >= len(s):
                    return True
            
            while not s[right].isalnum():
                right -= 1
            
            if s[left] != s[right]:
                return False
            
            left += 1
            right -= 1
        
        return True
        
