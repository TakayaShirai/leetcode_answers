# The isBadVersion API is already defined for you.
# def isBadVersion(version: int) -> bool:

class Solution:
    def firstBadVersion(self, n: int) -> int:
        badVerIdx = self.binarySearch(n, 1, n)
        
        while badVerIdx != -1:
            latestIdx = badVerIdx
            badVerIdx = self.binarySearch(n, 1, badVerIdx - 1)
        
        return latestIdx
            
        
    def binarySearch(self, n: int, left: int, right: int) -> int:
        while left <= right:
            mid = (left + right) // 2
            
            if isBadVersion(mid):
                return mid
            else:
                left = mid + 1
        
        return -1
        
