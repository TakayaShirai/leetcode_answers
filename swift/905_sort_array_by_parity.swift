class Solution {
  func sortArrayByParity(_ nums: [Int]) -> [Int] {
    var curNums: [Int] = nums
    var left: Int = 0
    var right: Int = nums.count - 1

    while left < right {
      if curNums[left] % 2 == 0 {
        left += 1
      } else {
        if curNums[right] % 2 == 1 {
          right -= 1
        } else {
          let tmp: Int = curNums[left]
          curNums[left] = curNums[right]
          curNums[right] = tmp
          left += 1
          right -= 1
        }
      }
    }

    return curNums
  }
}
