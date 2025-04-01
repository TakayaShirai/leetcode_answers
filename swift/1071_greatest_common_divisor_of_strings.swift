class Solution {
  func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    guard str1 + str2 == str2 + str1 else { return "" }

    let str1Chars: [Character] = Array(str1)
    let str2Chars: [Character] = Array(str2)
    let minStrLen: Int = min(str1.count, str2.count)
    var gcdString: String = ""

    for curIdx in 0..<minStrLen {
      guard str1Chars[curIdx] == str2Chars[curIdx] else { return gcdString }

      if str1.count % (curIdx + 1) == 0 && str2.count % (curIdx + 1) == 0 {
        gcdString = String(str1Chars[0...curIdx])
      }
    }

    return gcdString
  }
}
