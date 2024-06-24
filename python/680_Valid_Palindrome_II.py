class Solution:
    def validPalindrome(self, s: str) -> bool:
        if len(s) < 3:
            return True
        
        left = 0
        right = len(s) - 1
        
        while left < right:
            if s[left] != s[right]:
                return self.validSubPalindrome(s, left+1, right) or self.validSubPalindrome(s, left, right-1)
            
            left += 1
            right -= 1
                
        return True
    
    def validSubPalindrome(self, s: str, left: int, right: int) -> bool:        
        while left < right:
            if s[left] != s[right]:
                return False
            
            left += 1
            right -= 1
        
        return True
