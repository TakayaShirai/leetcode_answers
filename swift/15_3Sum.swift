class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // Two Pointers Approach
        var triplets: [[Int]] = []
        var sortedNums = nums.sorted()
        
        for (i, fixedNum) in sortedNums.enumerated() {
            if i > 0 && fixedNum == sortedNums[i-1] {
                continue
            }
            
            var left: Int = i + 1
            var right: Int = sortedNums.count - 1
            
            while left < right {
                var sum = sortedNums[left] + sortedNums[right] + fixedNum
                
                if sum > 0 {
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    triplets.append([sortedNums[left], sortedNums[right], fixedNum])
                    left += 1
                    while sortedNums[left] == sortedNums[left-1] && left < right {
                        left += 1
                    }
                }
            }
        }
        
        return triplets
        
        
//         Hash Map Approach
//         var triplets = Set<[Int]>()
        
//         for i in 0..<(nums.count-2) {
//             var seen: [Int : Int] = [:]
//             var target = -1 * nums[i]
            
//             for j in (i+1)..<(nums.count) {
//                 if let _ = seen[target - nums[j]] {
//                     triplets.insert([nums[i], nums[j], target - nums[j]].sorted()) 
//                 } else {
//                     seen[nums[j]] = 1
//                 }
//             }
//         }
        
//         return Array(triplets)
    }
}

