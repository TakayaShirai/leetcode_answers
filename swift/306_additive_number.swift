class Solution {
  func isAdditiveNumber(_ num: String) -> Bool {
    let inputNumLen: Int = num.count
    guard inputNumLen >= 3 else { return false }

    let startIdx = num.startIndex

    for num1CurIdx in 1..<(inputNumLen - 1) {
      let num1EndIdx = num.index(startIdx, offsetBy: num1CurIdx)
      let num1Str = String(num[..<num1EndIdx])

      guard !(num1Str.count > 1 && num1Str.first == "0"), let num1 = Int(num1Str) else { continue }

      for num2CurIdx in (num1CurIdx + 1)..<inputNumLen {
        let num2EndIdx = num.index(startIdx, offsetBy: num2CurIdx)
        let num2Str = String(num[num1EndIdx..<num2EndIdx])

        guard !(num2Str.count > 1 && num2Str.first == "0"), let num2 = Int(num2Str) else {
          continue
        }

        var curNum1: Int = num1
        var curNum2: Int = num2
        var num3StartIndex = num2EndIdx
        var count = 2

        while num3StartIndex < num.endIndex {
          let sumVal = curNum1 + curNum2
          let sumStr = String(sumVal)

          guard num[num3StartIndex...].hasPrefix(sumStr) else { break }

          num3StartIndex = num.index(num3StartIndex, offsetBy: sumStr.count)

          curNum1 = curNum2
          curNum2 = sumVal
          count += 1
        }

        guard !(num3StartIndex == num.endIndex && count >= 3) else { return true }
      }
    }

    return false
  }
}
