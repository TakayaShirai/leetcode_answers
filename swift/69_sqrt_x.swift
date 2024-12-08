class Solution {
  func mySqrt(_ x: Int) -> Int {
    var left: Int = 0
    var right: Int = x
    var res: Int = 0

    while left <= right {
      let mid = left + (right - left) / 2

      if mid * mid == x {
        return mid
      } else if mid * mid > x {
        right = mid - 1
      } else {
        left = mid + 1
        res = mid
      }
    }

    return res
  }
}
