class Solution {
    /// Returns the number of distinct ways to climb to the top of a staircase with n steps.
    func climbStairs(_ n: Int) -> Int {
        var oneStepBefore: Int = 1
        var twoStepBefore: Int = 0
        
        for _ in 0..<n-1 {
            var tmp = oneStepBefore
            oneStepBefore = oneStepBefore + twoStepBefore
            twoStepBefore = tmp
        }
        
        return oneStepBefore + twoStepBefore
    }
}

