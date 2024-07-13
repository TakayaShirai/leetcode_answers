class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set(nums)
        var longest: Int = 0
        var curNum: Int = 0
        
        for num in numSet {
            guard !numSet.contains(num-1) else { continue }
            
            curNum = num
            
            while numSet.contains(curNum + 1) {
                curNum += 1
            }
            
            longest = max(longest, curNum - num + 1)
        }
        
        return longest
    }
}

