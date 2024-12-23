class Solution {
  func lengthOfLastWord(_ s: String) -> Int {
    var lastWordLen: Int = 0

    for char in s.reversed() {
      if char == " " {
        if lastWordLen != 0 {
          return lastWordLen
        }

        continue
      } else {
        lastWordLen += 1
      }
    }

    return lastWordLen
  }
}
