class Solution {
  func myAtoi(_ s: String) -> Int {
    guard s.count > 0 else { return 0 }

    let noSpaceS: String = deleteSpace(s)
    let sign: Int = determineSign(noSpaceS)
    let resNum: Int = convertStringToInt(noSpaceS, sign)
    return resNum
  }

  private func deleteSpace(_ s: String) -> String {
    let arrayS = Array(s)
    var idx: Int = 0

    while idx < arrayS.count && arrayS[idx] == " " {
      idx += 1
    }

    return String(arrayS[idx..<arrayS.count])
  }

  private func determineSign(_ s: String) -> Int {
    let firstChar = s.first

    if firstChar == "-" {
      return -1
    } else {
      return 1
    }
  }

  private func convertStringToInt(_ s: String, _ sign: Int) -> Int {
    var resNum: Int = 0
    let arrayS = Array(s)
    var arraySIdx: Int = 0

    if s.first == "+" || s.first == "-" {
      arraySIdx = 1
    }

    let zeroAsciiVal = Character("0").asciiValue!  // safe to unwrap
    let nineAsciiVal = Character("9").asciiValue!  // safe to unwrap

    while arraySIdx < arrayS.count && arrayS[arraySIdx].isNumber {
      let char = arrayS[arraySIdx]
      guard let charAsciiVal = char.asciiValue else { break }
      let digit = Int(charAsciiVal - zeroAsciiVal)

      if resNum > Int32.max / 10 || (resNum == Int32.max / 10 && digit > Int32.max % 10) {
        return sign == 1 ? Int(Int32.max) : Int(Int32.min)
      }

      resNum = resNum * 10 + digit
      arraySIdx += 1
    }

    return resNum * sign
  }
}
