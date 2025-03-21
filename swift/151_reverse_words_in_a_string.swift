class Solution {
  func reverseWords(_ s: String) -> String {
    let words = s.split(separator: " ").map { String($0) }
    return words.reversed().joined(separator: " ")
  }
}
