class Solution {
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let sortedNums: [Int] = nums.sorted()
    var quadruples: [[Int]] = []

    quadruples = nSum(4, sortedNums, target)

    // for (fixedIdx, fixedNum) in sortedNums.enumerated() {
    //   if fixedIdx != 0 && fixedNum == sortedNums[fixedIdx - 1] {
    //     continue
    //   }

    //   let curTarget: Int = target - fixedNum
    //   var triplets: [[Int]] = threeSum(Array(sortedNums[(fixedIdx + 1)...]), curTarget)

    //   for triplet in triplets {
    //     let quadruples: [Int] = [fixedNum] + triplet
    //     quadruples.append(quadruples)
    //   }
    // }

    return quadruples
  }

  private func nSum(_ n: Int, _ sortedNums: [Int], _ target: Int) -> [[Int]] {
    guard n <= sortedNums.count else { return [] }
    var validSets: [[Int]] = []
    var curN: Int = n - 1

    for (fixedIdx, fixedNum) in sortedNums.enumerated() {
      if fixedIdx != 0 && fixedNum == sortedNums[fixedIdx - 1] {
        continue
      }

      var nMinusOneSum: [[Int]] = []

      if curN == 2 {
        nMinusOneSum = twoSum(Array(sortedNums[(fixedIdx + 1)...]), target - fixedNum)
      } else {
        nMinusOneSum = nSum(curN, Array(sortedNums[(fixedIdx + 1)...]), target - fixedNum)
      }

      for item in nMinusOneSum {
        let validSet = [fixedNum] + item
        validSets.append(validSet)
      }
    }

    return validSets
  }

  private func twoSum(_ sortedNums: [Int], _ target: Int) -> [[Int]] {
    var left: Int = 0
    var right: Int = sortedNums.count - 1
    var validPairs: [[Int]] = []

    while left < right {
      let curSum = sortedNums[left] + sortedNums[right]

      if curSum == target {
        validPairs.append([sortedNums[left], sortedNums[right]])
        left += 1
        while left < right && sortedNums[left] == sortedNums[left - 1] {
          left += 1
        }
      } else if curSum < target {
        left += 1
      } else {
        right -= 1
      }
    }

    return validPairs
  }

  private func threeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 3 else { return [] }
    var triplets: [[Int]] = []

    for (fixedIdx, fixedNum) in nums.enumerated() {
      if fixedIdx != 0 && fixedNum == nums[fixedIdx - 1] {
        continue
      }

      var left: Int = fixedIdx + 1
      var right: Int = nums.count - 1

      while left < right {
        let curSum = fixedNum + nums[left] + nums[right]

        if curSum == target {
          triplets.append([fixedNum, nums[left], nums[right]])
          left += 1
          while left < right && nums[left - 1] == nums[left] {
            left += 1
          }
        } else if curSum < target {
          left += 1
        } else {
          right -= 1
        }
      }
    }

    return triplets
  }
}
