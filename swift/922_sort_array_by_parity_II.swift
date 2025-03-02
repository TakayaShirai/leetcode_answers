class Solution {
  func sortArrayByParityII(_ nums: [Int]) -> [Int] {
    // Two Pointers
    var curNums: [Int] = nums
    var evenIdx: Int = 0
    var oddIdx: Int = 1

    while evenIdx < nums.count && oddIdx < nums.count {
      if curNums[evenIdx] % 2 == 0 {
        evenIdx += 2
      } else if curNums[oddIdx] % 2 == 1 {
        oddIdx += 2
      } else {
        swap(nums: &curNums, idx1: evenIdx, idx2: oddIdx)
        evenIdx += 2
        oddIdx += 2
      }
    }

    return curNums

    // Using Stack
    // var curNums: [Int] = nums
    // var evenNumIdxsStack: [Int] = []
    // var oddNumIdxsStack: [Int] = []

    // for (idx, num) in curNums.enumerated() {
    //   if idx % 2 == num % 2 {
    //     continue
    //   } else if num % 2 == 0 {
    //     if !oddNumIdxsStack.isEmpty {
    //       let oddNumIdx: Int = oddNumIdxsStack.removeLast()
    //       swap(nums: &curNums, idx1: idx, idx2: oddNumIdx)
    //     } else {
    //       evenNumIdxsStack.append(idx)
    //     }
    //   } else {
    //     if !evenNumIdxsStack.isEmpty {
    //       let evenNumIdx: Int = evenNumIdxsStack.removeLast()
    //       swap(nums: &curNums, idx1: idx, idx2: evenNumIdx)
    //     } else {
    //       oddNumIdxsStack.append(idx)
    //     }
    //   }
    // }

    // return curNums
  }

  private func swap(nums: inout [Int], idx1: Int, idx2: Int) {
    guard 0 <= idx1 && idx1 < nums.count && 0 <= idx2 && idx2 < nums.count else { return }
    let tmp: Int = nums[idx1]
    nums[idx1] = nums[idx2]
    nums[idx2] = tmp
  }
}
