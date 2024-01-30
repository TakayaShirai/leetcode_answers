class Solution:
    def climbStairs(self, n: int) -> int:
        oneStepBefore = 1
        twoStepsBefore = 0
        
        for _ in range(n-1):
            tmp = oneStepBefore
            oneStepBefore = oneStepBefore + twoStepsBefore
            twoStepsBefore = tmp
        
        return oneStepBefore + twoStepsBefore
        
        # recursive approach (time-complexity O(2^n)?)
        # if n == 0:
        #     return 0
        # elif n == 1:
        #     return 1
        # else:
        #     return self.climbStairs(n-1) + self.climbStairs(n-2)
        
