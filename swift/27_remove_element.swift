class Solution {
  func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    // O(n)
    var left: Int = 0

    for right in 0..<nums.count {
      if nums[right] != val {
        nums[left] = nums[right]
        left += 1
      }
    }

    return left

    // O(n^2)
    // var curIdx: Int = 0

    // while curIdx < nums.count {
    //   if nums[curIdx] == val {
    //     nums.remove(at: curIdx)
    //   } else {
    //     curIdx += 1
    //   }
    // }

    // return nums.count
  }
}
