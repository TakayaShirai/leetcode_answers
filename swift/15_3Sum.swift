class Solution {
  func threeSum(_ nums: [Int]) -> [[Int]] {
    let sortedNums: [Int] = nums.sorted()
    var triplets: [[Int]] = []

    for (fixedNumIdx, fixedNum) in sortedNums.enumerated() {
      if fixedNumIdx != 0 && fixedNum == sortedNums[fixedNumIdx - 1] {
        continue
      }

      var left: Int = fixedNumIdx + 1
      var right: Int = sortedNums.count - 1

      while left < right {
        let currentThreeSum = fixedNum + sortedNums[left] + sortedNums[right]

        if currentThreeSum == 0 {
          triplets.append([fixedNum, sortedNums[left], sortedNums[right]])
          left += 1
          while left < right && sortedNums[left - 1] == sortedNums[left] {
            left += 1
          }
        } else if currentThreeSum > 0 {
          right -= 1
        } else {
          left += 1
        }
      }
    }

    return triplets

    // var triplets: [[Int]: Int] = [:]

    // for (fixedNumIdx, fixedNum) in nums.enumerated() {
    //   var validPairs = twoSum(Array(nums[(fixedNumIdx + 1)...]), -fixedNum)

    //   guard !validPairs.isEmpty else { continue }

    //   for pair in validPairs {
    //     let threeSumRes = pair + [fixedNum]
    //     let sortedThreeSumRes = threeSumRes.sorted()
    //     triplets[sortedThreeSumRes] = 1
    //   }
    // }

    // return Array(triplets.keys)
  }

  // private func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
  //   var seenNums: [Int: Int] = [:]
  //   var validPairs: [[Int]] = []

  //   for (idx, num) in nums.enumerated() {
  //     if let complementNum = seenNums[target - num] {
  //       validPairs.append([num, complementNum])
  //     } else {
  //       seenNums[num] = num
  //     }
  //   }

  //   return validPairs
  // }
}
