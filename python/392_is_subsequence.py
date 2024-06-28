class Solution:
    ### isSubsequence returns true if s is a suvsequence of t, or false otherwise
    def isSubsequence(self, s: str, t: str) -> bool:
        currentIndex = 0
        
        for char in s:
            while currentIndex < len(t) and char != t[currentIndex]:
                currentIndex += 1
            
            if currentIndex == len(t):
                return False
            
            currentIndex += 1
        
        return True
        