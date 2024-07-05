class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counts: [Int : Int] = [:]
        var buckets: [[Int]] = []
        var topKElements: [Int] = []
        
        for _ in 0...nums.count {
            buckets.append([])
        }
        
        for num in nums {
            counts[num, default: 0] += 1
        }
        
        for (key, value) in counts {
            buckets[value].append(key)
        }
        
        for i in (0...nums.count).reversed() {
            for num in buckets[i] {
                topKElements.append(num)
                if topKElements.count == k {
                    return topKElements
                }
            }
        }
        
        return [-1, -1]
    }
}

