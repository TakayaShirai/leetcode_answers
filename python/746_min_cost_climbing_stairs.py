class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        dpOne = cost[0]
        dpTwo = cost[1]
        
        for i in range(2, len(cost)):
            temp = cost[i] + min(dpOne, dpTwo)
            dpOne = dpTwo
            dpTwo = temp
        
        return min(dpOne, dpTwo)