class Solution {
  func nextGreaterElements(_ nums: [Int]) -> [Int] {
    let numsLen: Int = nums.count
    var res: [Int] = Array(repeating: -1, count: nums.count)
    var monoDecStack: [Int] = []

    for i in 0..<(nums.count * 2 - 1) {
      let idx: Int = i % numsLen
      let curNum: Int = nums[idx]

      while !monoDecStack.isEmpty && curNum > nums[monoDecStack[monoDecStack.count - 1]] {
        let poppedNumIdx = monoDecStack.removeLast()
        res[poppedNumIdx] = curNum
      }

      monoDecStack.append(idx)
    }

    return res
  }
}
