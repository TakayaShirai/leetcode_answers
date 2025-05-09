class Solution {
  func defangIPaddr(_ address: String) -> String {
    var defangedIPaddr: String = ""
    let longestDefangedIPCharsLen: Int = 21
    defangedIPaddr.reserveCapacity(longestDefangedIPCharsLen)

    for char in address {
      if char == "." {
        defangedIPaddr.append("[")
        defangedIPaddr.append(char)
        defangedIPaddr.append("]")
      } else {
        defangedIPaddr.append(char)
      }
    }

    return defangedIPaddr
  }
}
