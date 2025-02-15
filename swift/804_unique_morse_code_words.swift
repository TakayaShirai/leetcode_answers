class Solution {
  func uniqueMorseRepresentations(_ words: [String]) -> Int {
    let morseCodes: [String] = [
      ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--",
      "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..",
    ]
    var tfSet: Set<String> = []
    let aAsciiVal: UInt8 = Character("a").asciiValue!

    for word in words {
      var curTf: String = ""

      for char in word {
        let charAsciiVal: UInt8 = char.asciiValue!
        let charIdx: Int = Int(charAsciiVal - aAsciiVal)
        curTf += morseCodes[charIdx]
      }

      tfSet.insert(curTf)
    }

    return tfSet.count
  }
}
