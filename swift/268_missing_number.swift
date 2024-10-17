class Solution {
  func missingNumber(_ nums: [Int]) -> Int {
    /// xor approach
    var xor = 0

    for i in 0..<nums.count {
      xor = xor ^ i ^ nums[i]
    }

    return xor ^ nums.count

    /// sum approach
    //         var res = nums.count

    //         for i in 0..<nums.count {
    //             res += (i - nums[i])
    //         }

    //         return res

    /// hash map approach
    //         var hashMap = [Int : Int]()

    //         for num in nums {
    //             hashMap[num] = 0
    //         }

    //         for i in 0..<(nums.count+1) {
    //             if let _ = hashMap[i] {
    //                 continue
    //             }

    //             return i
    //         }

    //         return -1
  }
}
