class Solution {
  func convertToTitle(_ columnNumber: Int) -> String {
    let numToStrMap: [Int: String] = [
      0: "A", 1: "B", 2: "C", 3: "D", 4: "E", 5: "F", 6: "G", 7: "H", 8: "I", 9: "J",
      10: "K", 11: "L", 12: "M", 13: "N", 14: "O", 15: "P", 16: "Q", 17: "R", 18: "S", 19: "T",
      20: "U", 21: "V", 22: "W", 23: "X", 24: "Y", 25: "Z",
    ]

    var curColumnNum: Int = columnNumber
    var resTitle: String = ""

    while curColumnNum > 0 {
      let adjustedNumber = curColumnNum - 1
      let curTitleNum: Int = adjustedNumber % 26
      let curTitle: String = numToStrMap[curTitleNum]!

      resTitle += curTitle

      curColumnNum = adjustedNumber / 26
    }

    return String(resTitle.reversed())
  }
}
