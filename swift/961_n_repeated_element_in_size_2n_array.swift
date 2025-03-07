class Solution {
  func repeatedNTimes(_ nums: [Int]) -> Int {
    var numsSet: Set<Int> = []

    for num in nums {
      if numsSet.contains(num) {
        return num
      } else {
        numsSet.insert(num)
      }
    }

    return -1
  }
}
