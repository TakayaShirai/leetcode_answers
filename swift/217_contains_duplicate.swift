class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashMap: [Int: Int] = [:]
        
        for num in nums {
            if let _ = hashMap[num] {
                return true
            } else {
                hashMap[num] = 0
            }
        }
        
        return false
     
// another approach
//         let sortedNums = nums.sorted()
        
//         for i in 0..<(nums.count-1) {
//             if sortedNums[i] == sortedNums[i+1] {
//                 return true
//             }
//         }
        
//         return false
    }
}

