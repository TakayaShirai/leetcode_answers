class Solution {
  func prefixesDivBy5(_ nums: [Int]) -> [Bool] {
    var curNum: Int = 0
    var boolArr: [Bool] = []

    for (idx, bit) in nums.enumerated() {
      curNum = (curNum << 1 + bit) % 5
      boolArr.append(curNum == 0)
    }

    return boolArr
  }
}
