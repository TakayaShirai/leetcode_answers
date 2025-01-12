class Solution {
  func addStrings(_ num1: String, _ num2: String) -> String {
    let arrayNum1 = Array(num1)
    let arrayNum2 = Array(num2)

    var num1Idx: Int = num1.count - 1
    var num2Idx: Int = num2.count - 1
    var curSum: String = ""
    var carry: Int = 0

    while num1Idx >= 0 || num2Idx >= 0 {
      // Space complexity: O(1)
      // let num1Digit: Int = covertCharToInt(num1, at: num1Idx)
      // let num2Digit: Int = covertCharToInt(num2, at: num2Idx)

      // Space complexity: O(n) (Array(num1), Array(num2))
      let num1Digit: Int = num1Idx >= 0 ? convertCharToInt2(arrayNum1[num1Idx]) : 0
      let num2Digit: Int = num2Idx >= 0 ? convertCharToInt2(arrayNum2[num2Idx]) : 0

      var tmpSum: Int = num1Digit + num2Digit + carry

      carry = tmpSum / 10
      curSum += String(tmpSum % 10)

      num1Idx -= 1
      num2Idx -= 1
    }

    return carry == 1 ? "1" + String(curSum.reversed()) : String(curSum.reversed())
  }

  private func convertCharToInt2(_ char: Character) -> Int {
    let charToIntMap: [Character: Int] = [
      "0": 0,
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5,
      "6": 6,
      "7": 7,
      "8": 8,
      "9": 9,
    ]

    guard let num = charToIntMap[char] else { return 0 }
    return num
  }

  private func covertCharToInt(_ str: String, at index: Int) -> Int {
    guard index >= 0 && index < str.count else { return 0 }

    let charToIntMap: [Character: Int] = [
      "0": 0,
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5,
      "6": 6,
      "7": 7,
      "8": 8,
      "9": 9,
    ]

    if let stringIndex = str.index(str.startIndex, offsetBy: index, limitedBy: str.endIndex) {
      guard let num = charToIntMap[str[stringIndex]] else { return 0 }
      return num
    } else {
      return 0
    }
  }
}
