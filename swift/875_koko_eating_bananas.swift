class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        if h < piles.count {
            return -1
        }

        let highestPile: Int = piles.max()!
        
        var left: Int = 1
        var right: Int = highestPile
        var minSpeed: Int = highestPile
        
        while left <= right {
            var k: Int = (left + right) / 2
            var totalTime: Int = 0
            
            for pile in piles {
                if (pile % k) == 0 {
                    totalTime += pile / k
                } else {
                    totalTime += (pile / k) + 1
                }
                
                if totalTime > h {
                    break
                }
            }
            
            if totalTime <= h {
                minSpeed = min(minSpeed, k)
                right = k - 1
            } else {
                left = k + 1
            }
        }
        
        return minSpeed
    }
}

