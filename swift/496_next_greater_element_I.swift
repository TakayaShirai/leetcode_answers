class Solution {
  func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    // Monotonic stack
    var nums1NumToIdxMap: [Int: Int] = [:]

    for (idx, num) in nums1.enumerated() {
      nums1NumToIdxMap[num] = idx
    }

    var monoDecStack: [Int] = []
    var res: [Int] = Array(repeating: -1, count: nums1.count)

    for num2 in nums2 {
      while !monoDecStack.isEmpty && num2 > monoDecStack[monoDecStack.count - 1] {
        let poppedNum: Int = monoDecStack.removeLast()
        guard let nums1Idx = nums1NumToIdxMap[poppedNum] else { break }
        res[nums1Idx] = num2
      }

      monoDecStack.append(num2)
    }

    return res

    // Brute Force
    // var res: [Int] = []

    // for num1 in nums1 {
    //     let num1Idx: Int = findNum(in: nums2, target: num1)

    //     for num2Idx in num1Idx..<nums2.count {
    //         if num1 < nums2[num2Idx] {
    //             res.append(nums2[num2Idx])
    //             break
    //         }

    //         if num2Idx == nums2.count - 1 {
    //             res.append(-1)
    //         }
    //     }
    // }

    // return res
  }

  private func findNum(in nums: [Int], target: Int) -> Int {
    for (idx, num) in nums.enumerated() {
      if num == target {
        return idx
      }
    }

    return -1
  }
}
