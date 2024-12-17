class Solution {
  func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let sortedNums: [Int] = nums.sorted()

    var closestThreeSum: Int = nums[0] + nums[1] + nums[2]

    for (fixedNumIdx, fixedNum) in sortedNums.enumerated() {
      guard fixedNumIdx == 0 || fixedNum != sortedNums[fixedNumIdx - 1] else { continue }

      var leftIdx: Int = fixedNumIdx + 1
      var rightIdx: Int = sortedNums.count - 1

      while leftIdx < rightIdx {
        let curThreeSum: Int = fixedNum + sortedNums[leftIdx] + sortedNums[rightIdx]

        if curThreeSum == target {
          return target
        } else if curThreeSum > target {
          rightIdx -= 1
        } else {
          leftIdx += 1
        }

        if abs(curThreeSum - target) < abs(closestThreeSum - target) {
          closestThreeSum = curThreeSum
        }
      }
    }

    return closestThreeSum
  }
}
