class Solution {
  func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    // Two Pointers
    var left: Int = 0
    var curProduct: Int = 1
    var count: Int = 0

    for right in 0..<nums.count {
      curProduct *= nums[right]

      while left <= right && curProduct >= k {
        curProduct /= nums[left]
        left += 1
      }

      count += right - left + 1
    }

    return count

    // Brute Force
    // guard k != 0 else { return 0 }

    // var count: Int = 0

    // for start in 0..<nums.count {
    //     var last: Int = start
    //     var curProduct: Int = nums[start]

    //     while curProduct < k {
    //         if curProduct == 0 {
    //             count += nums.count - last
    //             break
    //         }

    //         count += 1

    //         guard last + 1 < nums.count else { break }
    //         last += 1
    //         curProduct *= nums[last]
    //     }
    // }

    // return count
  }
}
