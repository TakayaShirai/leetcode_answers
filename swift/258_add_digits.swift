class Solution {
  func addDigits(_ num: Int) -> Int {
    // 1. Check if the num is larger than 9.
    // 2. If it is, add all digits and return to 1 again.
    // 2. If not, return the num.
    // var curNum: Int = num

    // while curNum > 9 {
    //     curNum = calcSumOfAllDigits(curNum)
    // }

    // return curNum

    // O(1) Approach
    if num == 0 {
      return 0
    } else {
      return num % 9 == 0 ? 9 : num % 9
    }
  }

  private func calcSumOfAllDigits(_ num: Int) -> Int {
    var total: Int = 0
    var curNum: Int = num

    while curNum > 0 {
      total += curNum % 10
      curNum /= 10
    }

    return total
  }
}
