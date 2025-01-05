class Solution {
  func reverseString(_ s: inout [Character]) {
    var left: Int = 0
    var right: Int = s.count - 1

    while left < right {
      let tmp: Character = s[left]
      s[left] = s[right]
      s[right] = tmp

      left += 1
      right -= 1
    }

    return
  }
}
