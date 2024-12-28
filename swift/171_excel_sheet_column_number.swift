class Solution {
  func titleToNumber(_ columnTitle: String) -> Int {
    let aAsciiValue = Int(Character("A").asciiValue!)
    var resNum = 0

    for char in columnTitle {
      let charValue = Int(char.asciiValue!) - aAsciiValue + 1
      resNum = resNum * 26 + charValue
    }

    return resNum
  }
}
