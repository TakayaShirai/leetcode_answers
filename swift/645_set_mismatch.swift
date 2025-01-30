class Solution {
  func findErrorNums(_ nums: [Int]) -> [Int] {
    var duplicatedNum: Int = getDuplicatedNums(in: nums)
    var numsSet: Set<Int> = Set(nums)

    var missingNum: Int = -1

    for num in 1...nums.count {
      if !numsSet.contains(num) {
        missingNum = num
        break
      }
    }

    return [duplicatedNum, missingNum]
  }

  private func getDuplicatedNums(in nums: [Int]) -> Int {
    var numsSet: Set<Int> = []

    for num in nums {
      if numsSet.contains(num) {
        return num
      }

      numsSet.insert(num)
    }

    return -1
  }
}
