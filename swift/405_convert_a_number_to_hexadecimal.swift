class Solution {
  func toHex(_ num: Int) -> String {
    guard num != 0 else { return "0" }

    var numToHex: [Int: String] = [
      10: "a",
      11: "b",
      12: "c",
      13: "d",
      14: "e",
      15: "f",
    ]

    var curNum: Int = num
    var reversedHex: String = ""
    var count: Int = 0

    while curNum != 0 && count < 8 {
      let curDigit: Int = curNum & 15

      if curDigit < 10 {
        reversedHex += String(curDigit)
      } else {
        reversedHex += numToHex[curDigit]!
      }

      curNum = curNum >> 4
      count += 1
    }

    return String(reversedHex.reversed())
  }
}
