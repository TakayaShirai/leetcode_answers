class Solution {
  func countAndSay(_ n: Int) -> String {
    // Iterative
    var curRLE: String = "1"

    for _ in 1..<n {
      curRLE = runLengthEncoding(Array(curRLE))
    }

    return curRLE

    // Recursive
    // if n == 1 {
    //   return "1"
    // } else {
    //   return runLengthEncoding(Array(countAndSay(n - 1)))
    // }
  }

  private func runLengthEncoding(_ charArray: [Character]) -> String {
    guard !charArray.isEmpty else { return "" }

    var curIdx: Int = 0
    var curChar: Character = charArray[0]

    var encodedString: String = ""
    var sameCharCnt: Int = 0

    while curIdx < charArray.count {
      if charArray[curIdx] == curChar {
        sameCharCnt += 1
        curIdx += 1
      } else {
        encodedString += String(sameCharCnt)
        encodedString += String(curChar)
        sameCharCnt = 0
        curChar = charArray[curIdx]
      }
    }

    encodedString += String(sameCharCnt)
    encodedString += String(curChar)

    return encodedString
  }
}
