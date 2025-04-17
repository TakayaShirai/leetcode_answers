class Solution {
  func lengthOfLastWord(_ s: String) -> Int {
    var separatedStr = s.split(separator: " ")
    return separatedStr[separatedStr.count - 1].count
  }
}
