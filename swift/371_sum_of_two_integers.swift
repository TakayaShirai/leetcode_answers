class Solution {
  func getSum(_ a: Int, _ b: Int) -> Int {
    var twoIntSum = a
    var carryNum = b

    while carryNum != 0 {
      let tmp = (twoIntSum & carryNum) << 1
      twoIntSum = (twoIntSum ^ carryNum)
      carryNum = tmp
    }

    return twoIntSum
  }
}
