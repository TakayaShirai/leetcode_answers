class Solution {
  func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    var left: Int = findMax(in: weights)
    var right: Int = weights.total
    var minCaps: Int = Int.max

    while left <= right {
      let mid: Int = left + (right - left) / 2
      var curDays = 0
      var curTotalWeight = 0

      for weight in weights {
        curTotalWeight += weight
        guard curTotalWeight <= mid else {
          curTotalWeight = weight
          curDays += 1
          continue
        }
      }

      curDays += 1

      if curDays <= days {
        minCaps = min(minCaps, mid)
        right = mid - 1
      } else {
        left = mid + 1
      }
    }

    return minCaps
  }

  private func findMax(in nums: [Int]) -> Int {
    var maxNum: Int = Int.min

    for num in nums {
      maxNum = max(maxNum, num)
    }

    return maxNum
  }
}

extension Array where Element == Int {
  var total: Int {
    self.reduce(0, +)
  }
}
