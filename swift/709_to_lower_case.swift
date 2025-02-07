class Solution {
  func toLowerCase(_ s: String) -> String {
    let lowerAAsciiVal: UInt8 = Character("a").asciiValue!
    let upperAAsciiVal: UInt8 = Character("A").asciiValue!
    let upperZAsciiVal: UInt8 = Character("Z").asciiValue!

    var lowercasedStr: String = ""

    for char in s {
      if let charAsciiVal = char.asciiValue,
        charAsciiVal >= upperAAsciiVal && charAsciiVal <= upperZAsciiVal
      {
        let lowercasedAsciiVal: UInt8 = charAsciiVal - upperAAsciiVal + lowerAAsciiVal
        lowercasedStr.append(Character(UnicodeScalar(lowercasedAsciiVal)))
      } else {
        lowercasedStr.append(char)
      }
    }

    return lowercasedStr
  }
}
