class Solution {
  func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
    var curLineLen: Int = 0
    var totalLineCnt: Int = 1
    let aAsciiVal: UInt8 = Character("a").asciiValue!
    let maxLineLen: Int = 100

    for char in s {
      let charAsciiVal = char.asciiValue!
      let charIdx: Int = Int(charAsciiVal - aAsciiVal)
      let charReqPixels: Int = widths[charIdx]

      if curLineLen + charReqPixels > maxLineLen {
        curLineLen = charReqPixels
        totalLineCnt += 1
      } else {
        curLineLen += charReqPixels
      }
    }

    return [totalLineCnt, curLineLen]
  }
}
