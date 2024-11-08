class Solution {
  func majorityElement(_ nums: [Int]) -> Int {
    var count: Int = 0
    var res: Int = nums[0]

    for num in nums {
      if num == res {
        count += 1
      } else {
        count -= 1

        if count == -1 {
          res = num
          count += 1
        }
      }
    }

    return res
  }
}
