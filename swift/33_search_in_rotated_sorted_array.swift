class Solution {
  func search(_ nums: [Int], _ target: Int) -> Int {
    let rotationCnt: Int = findMinValIdx(from: nums)
    let numsLen: Int = nums.count

    print(rotationCnt)

    var left: Int = 0
    var right: Int = numsLen - 1

    while left <= right {
      let mid: Int = left + (right - left) / 2
      let shiftedMid: Int = (mid + rotationCnt) % numsLen

      if nums[shiftedMid] == target {
        return shiftedMid
      } else if nums[shiftedMid] < target {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    return -1
  }

  private func findMinValIdx(from nums: [Int]) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left < right {
      let mid: Int = left + (right - left) / 2

      if nums[mid] > nums[right] {
        left = mid + 1
      } else {
        right = mid
      }
    }

    return left
  }
}
