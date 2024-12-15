class Solution {
  func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else { return s }

    let arrayS = Array(s)
    var dpMap = setUpDpMap(arrayS)
    var resStart: Int = 0
    var resEnd: Int = 0

    for substrLen in 2..<(arrayS.count + 1) {
      for start in 0..<(arrayS.count - substrLen + 1) {
        let end = start + substrLen - 1
        if arrayS[start] == arrayS[end] && (substrLen == 2 || dpMap[start + 1][end - 1] == 1) {
          dpMap[start][end] = 1

          if substrLen > resEnd - resStart + 1 {
            resStart = start
            resEnd = end
          }
        }
      }
    }

    return String(arrayS[resStart..<(resEnd + 1)])
  }

  private func setUpDpMap(_ arrayS: [Character]) -> [[Int]] {
    var dpMap = Array(repeating: Array(repeating: 0, count: arrayS.count), count: arrayS.count)

    for i in 0..<arrayS.count {
      dpMap[i][i] = 1
    }

    return dpMap
  }
}
