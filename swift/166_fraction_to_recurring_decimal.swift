class Solution {
  func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    var decimalStr: String = ""

    if numerator * denominator < 0 {
      decimalStr.append("-")
    }

    var absNum: Int = abs(numerator)
    var absDen: Int = abs(denominator)

    var intPart: Int = absNum / absDen
    decimalStr.append(String(intPart))

    var remainder = absNum % absDen
    guard remainder != 0 else { return decimalStr }

    decimalStr.append(".")
    var remainderDict = [Int: Int]()

    while remainder != 0 {
      if let index = remainderDict[remainder] {
        let startIndex = decimalStr.index(decimalStr.startIndex, offsetBy: index)
        decimalStr.insert("(", at: startIndex)
        decimalStr.append(")")
        break
      }

      remainderDict[remainder] = decimalStr.count

      remainder *= 10
      decimalStr.append("\(remainder / absDen)")
      remainder %= absDen
    }

    return decimalStr
  }
}
