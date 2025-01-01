/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution: VersionControl {
  func firstBadVersion(_ n: Int) -> Int {
    // Binary Serach Solution
    // Time: O(logn), Space: O(1)
    var left: Int = 1
    var right: Int = n

    while left <= right {
      let mid = left + (right - left) / 2

      if isBadVersion(mid) {
        right = mid - 1
      } else {
        left = mid + 1
      }
    }

    if left == (n + 1) {
      return -1
    }

    return left

    // Simple Solution
    // Time: O(n), Space: O(1)
    // var curVersion: Int = 1

    // while !isBadVersion(curVersion) {
    //     curVersion += 1
    // }

    // return curVersion
  }
}
