class Solution {
  func convertToBase7(_ num: Int) -> String {
    guard num != 0 else { return "0" }

    var curNum: Int = num > 0 ? num : -num
    var reversedStr: String = ""

    while curNum > 0 {
      let curDigit: Int = curNum % 7
      reversedStr += String(curDigit)
      curNum /= 7
    }

    return num > 0 ? String(reversedStr.reversed()) : "-" + String(reversedStr.reversed())
  }
}
