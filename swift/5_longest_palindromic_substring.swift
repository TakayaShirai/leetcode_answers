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

class Solution {
  func longestPalindrome(_ s: String) -> String {
    let characters = Array(s)
    var resultStart = 0
    var resultEnd = 0

    for center in 0..<characters.count {
      let oddIndices = findLongestPalindrome(center, center, characters)
      let evenIndices = findLongestPalindrome(center, center + 1, characters)

      (resultStart, resultEnd) = updateIndices(oddIndices, evenIndices, resultStart, resultEnd)
    }

    return String(characters[resultStart...resultEnd])
  }

  private func findLongestPalindrome(_ left: Int, _ right: Int, _ arrayS: [Character]) -> (Int, Int)
  {
    var curLeft: Int = left
    var curRight: Int = right
    var resLeft: Int = left
    var resRight: Int = left

    while curLeft >= 0 && curRight < arrayS.count {
      let leftChar = arrayS[curLeft]
      let rightChar = arrayS[curRight]

      if leftChar == rightChar {
        resLeft = curLeft
        resRight = curRight
        curLeft -= 1
        curRight += 1
      } else {
        return (resLeft, resRight)
      }
    }

    return (resLeft, resRight)
  }

  private func updateIndices(
    _ oddIndices: (Int, Int),
    _ evenIndices: (Int, Int),
    _ currentStart: Int,
    _ currentEnd: Int
  ) -> (Int, Int) {
    let (oddStart, oddEnd) = oddIndices
    let (evenStart, evenEnd) = evenIndices

    let oddLength = oddEnd - oddStart + 1
    let evenLength = evenEnd - evenStart + 1
    let currentLength = currentEnd - currentStart + 1

    if oddLength > currentLength && oddLength >= evenLength {
      return (oddStart, oddEnd)
    } else if evenLength > currentLength {
      return (evenStart, evenEnd)
    }

    return (currentStart, currentEnd)
  }
}
