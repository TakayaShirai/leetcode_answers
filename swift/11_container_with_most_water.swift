class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var curMax: Int = 0
        var x1: Int = 0
        var x2: Int = height.count - 1
        
        while x1 < x2 {
            curMax = max(curMax, (x2 - x1) * min(height[x1], height[x2]))
            
            if height[x1] > height[x2] {
                x2 -= 1
            } else {
                x1 += 1
            }
        }
        
        return curMax        
    }
}

